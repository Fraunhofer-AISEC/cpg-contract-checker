/*
 * Copyright (c) 2024, Fraunhofer AISEC. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * ╔═╗╔═╗╔═╗   ╔═╗┌─┐┌┐┌┌┬┐┬─┐┌─┐┌─┐┌┬┐  ╔═╗┬ ┬┌─┐┌─┐┬┌─┌─┐┬─┐
 * ║  ╠═╝║ ╦───║  │ ││││ │ ├┬┘├─┤│   │───║  ├─┤├┤ │  ├┴┐├┤ ├┬┘
 * ╚═╝╩  ╚═╝   ╚═╝└─┘┘└┘ ┴ ┴└─┴ ┴└─┘ ┴   ╚═╝┴ ┴└─┘└─┘┴ ┴└─┘┴└─
 *
 */
package de.fraunhofer.aisec.cpg.frontends.solidity

import de.fraunhofer.aisec.cpg.TranslationContext
import de.fraunhofer.aisec.cpg.frontends.Handler
import de.fraunhofer.aisec.cpg.frontends.Language
import de.fraunhofer.aisec.cpg.frontends.LanguageFrontend
import de.fraunhofer.aisec.cpg.graph.newUnknownType
import de.fraunhofer.aisec.cpg.graph.types.*
import java.util.concurrent.ConcurrentHashMap
import org.antlr.v4.runtime.ParserRuleContext
import org.antlr.v4.runtime.tree.TerminalNode
import org.slf4j.LoggerFactory

class TypeHandler(lang: SolidityLanguageFrontend) :
    Handler<Type, ParserRuleContext, SolidityLanguageFrontend>(
        { UnknownType.getUnknownType(language = lang.language) },
        lang
    ) {

    private val logger = LoggerFactory.getLogger(TypeHandler::class.java)

    init {
        map.put(SolidityParser.TypeNameContext::class.java) {
            handleTypeName(it as SolidityParser.TypeNameContext)
        }
        map.put(SolidityParser.ElementaryTypeNameContext::class.java) {
            handleElementaryTypeName(it as SolidityParser.ElementaryTypeNameContext)
        }
        map.put(SolidityParser.UserDefinedTypeNameContext::class.java) {
            handleUserDefinedTypeName(it as SolidityParser.UserDefinedTypeNameContext)
        }
        map.put(SolidityParser.MappingKeyContext::class.java) {
            handleMappingKey(it as SolidityParser.MappingKeyContext)
        }

        // can we adapt the type parser here to properly fit the Solidity types?
    }

    private fun handleMappingKey(ctx: SolidityParser.MappingKeyContext): Type? {
        return if (ctx.elementaryTypeName() != null) {
            handle(ctx.elementaryTypeName())
        } else if (ctx.userDefinedTypeName() != null) {
            handle(ctx.userDefinedTypeName())
        } else null
    }

    private fun handleUserDefinedTypeName(ctx: SolidityParser.UserDefinedTypeNameContext): Type {
        return ObjectType(ctx.text.trim(), mutableListOf<Type>(), false, frontend.language)
    }

    private fun handleElementaryTypeName(ctx: SolidityParser.ElementaryTypeNameContext): Type {
        return when (ctx.text.trim()) {
            "address" -> TypeParser.createFrom("address", language, false, frontend.ctx)
            "bool" -> BooleanType(ctx.text.trim())
            "string" -> StringType(ctx.text.trim())
            "var" -> UnknownType.getUnknownType(language)
            "byte" -> NumericType(modifier = NumericType.Modifier.UNSIGNED, bitWidth = 8)
            else -> {
                if (ctx.Int() != null)
                    IntegerType(
                        ctx.text.trim(),
                        modifier = NumericType.Modifier.SIGNED,
                        bitWidth = getBitSize(ctx.Int(), 1)
                    )
                else if (ctx.Uint() != null)
                    IntegerType(
                        ctx.text.trim(),
                        modifier = NumericType.Modifier.UNSIGNED,
                        bitWidth = getBitSize(ctx.Uint(), 1)
                    )
                else if (ctx.Byte() != null)
                    NumericType(
                        ctx.text.trim(),
                        modifier = NumericType.Modifier.UNSIGNED,
                        bitWidth = getBitSize(ctx.Byte(), 1) * 8
                    )
                else if (ctx.Fixed() != null)
                    NumericType(
                        ctx.text.trim(),
                        modifier = NumericType.Modifier.SIGNED,
                        bitWidth = getBitSize(ctx.Fixed(), 1)
                    )
                else if (ctx.Ufixed() != null)
                    NumericType(
                        ctx.text.trim(),
                        modifier = NumericType.Modifier.UNSIGNED,
                        bitWidth = getBitSize(ctx.Ufixed(), 1)
                    )
                else UnknownType.getUnknownType(language)
            }
        }
    }

    private fun getBitSize(terminalNode: TerminalNode, bitSizePos: Int): Int {
        if (terminalNode.childCount == bitSizePos + 1)
            return terminalNode.getChild(bitSizePos).toString().toInt()
        return 256
    }

    private fun handleTypeName(ctx: SolidityParser.TypeNameContext): Type {
        if (ctx.elementaryTypeName() != null) {
            return TypeParser.createFrom(
                ctx.elementaryTypeName().text.trim(),
                language,
                false,
                frontend.ctx
            )
        }

        ctx.userDefinedTypeName()?.let {
            return TypeParser.createFrom(it.text.trim(), language, false, frontend.ctx)
        }
        ctx.mapping()?.let {
            return ObjectType(
                "mapping",
                mutableListOf<Type>(
                    handle(it.mappingKey()) ?: UnknownType.getUnknownType(language),
                    handle(it.typeName()) ?: UnknownType.getUnknownType(language)
                ),
                true,
                frontend.language
            )
        }
        ctx.typeName()?.let {
            return TypeParser.createFrom(ctx.text.trim(), language, false, frontend.ctx)
        }
        ctx.functionTypeName()?.let {
            return TypeParser.createFrom(it.text.trim(), language, false, frontend.ctx)
        }
        if (ctx.getStart().equals("address")) {
            return getAddressType(language, frontend.ctx)
        }

        logger.warn("Empty type name could not be translated properly")

        return newUnknownType()
    }

    companion object {
        /** A map of [UnknownType] and their respective [Language]. */
        private val addressTypes = ConcurrentHashMap<Language<*>?, Type>()

        var memberTypeMap = mapOf<String, Type>()
        var addressExtenderMembers = listOf("call", "value", "gas")

        @JvmStatic
        fun getPredefinedTypes(
            name: String,
            language: Language<out LanguageFrontend>?,
            transContext: TranslationContext
        ): Type {
            if (memberTypeMap.isEmpty()) {
                memberTypeMap =
                    mapOf(
                        // "blockhash(uint blockNumber)" returns (bytes32)
                        // "blobhash(uint index)" returns (bytes32)
                        "block.basefee" to
                            IntegerType(
                                "uint256",
                                modifier = NumericType.Modifier.UNSIGNED,
                                bitWidth = 256
                            ),
                        "block.blobbasefee" to
                            IntegerType(
                                "uint256",
                                modifier = NumericType.Modifier.UNSIGNED,
                                bitWidth = 256
                            ),
                        "block.chainid" to
                            IntegerType(
                                "uint256",
                                modifier = NumericType.Modifier.UNSIGNED,
                                bitWidth = 256
                            ),
                        "block.coinbase" to getAddressType(language, transContext),
                        "block.difficulty" to
                            IntegerType(
                                "uint256",
                                modifier = NumericType.Modifier.UNSIGNED,
                                bitWidth = 256
                            ),
                        "block.gaslimit" to
                            IntegerType(
                                "uint256",
                                modifier = NumericType.Modifier.UNSIGNED,
                                bitWidth = 256
                            ),
                        "block.number" to
                            IntegerType(
                                "uint256",
                                modifier = NumericType.Modifier.UNSIGNED,
                                bitWidth = 256
                            ),
                        "block.prevrandao" to
                            IntegerType(
                                "uint256",
                                modifier = NumericType.Modifier.UNSIGNED,
                                bitWidth = 256
                            ),
                        "block.timestamp" to
                            IntegerType(
                                "uint256",
                                modifier = NumericType.Modifier.UNSIGNED,
                                bitWidth = 256
                            ),
                        // "gasleft()" returns (uint256)
                        "msg.data" to
                            NumericType("bytes", modifier = NumericType.Modifier.UNSIGNED),
                        "msg.sender" to getAddressType(language, transContext),
                        "msg.sig" to
                            NumericType(
                                "bytes4",
                                modifier = NumericType.Modifier.UNSIGNED,
                                bitWidth = 4 * 8
                            ),
                        "msg.value" to
                            IntegerType(
                                "uint256",
                                modifier = NumericType.Modifier.UNSIGNED,
                                bitWidth = 256
                            ),
                        "tx.gasprice" to
                            IntegerType(
                                "uint256",
                                modifier = NumericType.Modifier.UNSIGNED,
                                bitWidth = 256
                            ),
                        "tx.origin" to getAddressType(language, transContext)
                    )
            }
            return memberTypeMap.getOrDefault(name, UnknownType.getUnknownType(language))
        }

        /** Use this function to obtain an [UnknownType] for the particular [language]. */
        @JvmStatic
        fun getAddressType(
            language: Language<out LanguageFrontend>?,
            transContext: TranslationContext
        ): Type {

            return addressTypes.computeIfAbsent(language) {
                val addressType = TypeParser.createFrom("address", language, false, transContext)
                addressType.language = language
                addressType
            }
        }
    }
}
