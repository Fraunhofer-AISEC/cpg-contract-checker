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

import SolidityLexer
import SolidityParser
import de.fraunhofer.aisec.cpg.ResolveInFrontend
import de.fraunhofer.aisec.cpg.TranslationContext
import de.fraunhofer.aisec.cpg.frontends.Language
import de.fraunhofer.aisec.cpg.frontends.LanguageFrontend
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.ModifierDefinition
import de.fraunhofer.aisec.cpg.graph.*
import de.fraunhofer.aisec.cpg.graph.declarations.*
import de.fraunhofer.aisec.cpg.graph.types.Type
import de.fraunhofer.aisec.cpg.graph.types.TypeParser
import de.fraunhofer.aisec.cpg.passes.EvaluationOrderGraphPass
import de.fraunhofer.aisec.cpg.passes.order.RegisterExtraPass
import de.fraunhofer.aisec.cpg.passes.order.ReplacePass
import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import de.fraunhofer.aisec.cpg.sarif.Region
import java.io.File
import java.io.FileInputStream
import java.util.*
import org.antlr.v4.runtime.ANTLRInputStream
import org.antlr.v4.runtime.CommonTokenStream
import org.antlr.v4.runtime.ParserRuleContext
import org.antlr.v4.runtime.Token
import org.antlr.v4.runtime.misc.Interval
import org.eclipse.cdt.core.dom.ast.*
import org.slf4j.LoggerFactory

@ReplacePass(EvaluationOrderGraphPass::class, SolidityLanguage::class, EOGExtensionPass::class)
@RegisterExtraPass(ConstructorResolutionPass::class)
class SolidityLanguageFrontend(
    language: Language<SolidityLanguageFrontend>,
    ctx: TranslationContext
) : LanguageFrontend(language, ctx) {

    private val logger = LoggerFactory.getLogger(SolidityLanguageFrontend.javaClass)

    val statementHandler = StatementHandler(this)
    val expressionHandler = ExpressionHandler(this)
    val typeHandler = TypeHandler(this)
    val declarationHandler = DeclarationHandler(this)
    var currentFile: File? = null

    var modifierStack: Stack<ParserRuleContext> = Stack<ParserRuleContext>()

    val functionsWithModifiers:
        MutableMap<SolidityParser.FunctionDefinitionContext, MethodDeclaration> =
        mutableMapOf()
    val functionsWithModifiersAndNamedRet:
        MutableMap<SolidityParser.FunctionDefinitionContext, SolidityParser.ParameterListContext> =
        mutableMapOf()
    val modifierMap: MutableMap<ModifierDefinition, SolidityParser.ModifierDefinitionContext> =
        mutableMapOf()
    val modifierIdentifierMap:
        MutableMap<
            SolidityParser.ModifierDefinitionContext,
            MutableMap<String, SolidityParser.ExpressionContext>
        > =
        mutableMapOf()
    var currentIdentifierMapStack: Stack<MutableMap<String, SolidityParser.ExpressionContext>> =
        Stack<MutableMap<String, SolidityParser.ExpressionContext>>()

    public val declaredTypes = mutableMapOf<String, Node>()

    val pragmas: MutableList<Declaration> = mutableListOf()

    override fun parse(file: File): TranslationUnitDeclaration {

        val lexer = SolidityLexer(ANTLRInputStream(FileInputStream(file)))
        val stream = CommonTokenStream(lexer)
        val parser = SolidityParser(stream)
        currentFile = file

        val tu = handleSourceUnit(file.name, parser.sourceUnit())
        return tu
    }

    companion object {
        @kotlin.jvm.JvmField var SOLIDITY_EXTENSIONS: List<String> = listOf(".sol")
    }

    private fun handleSourceUnit(
        filename: String,
        unit: SolidityParser.SourceUnitContext
    ): TranslationUnitDeclaration {
        var tu = newTranslationUnitDeclaration(filename, unit.text, unit)

        // reset global scope to this translation unit
        this.scopeManager.resetToGlobal(tu)

        this.scopeManager.lang = this

        for (pragma in unit.pragmaDirective()) {
            this.declarationHandler.handle(pragma)?.let { pragmas.add(it) }
        }

        for (contract in unit.contractDefinition()) {
            var decl = this.declarationHandler.handle(contract)

            // add contract declaration to TU
            this.scopeManager.addDeclaration(decl)
        }

        if (unit.contractPart() != null || unit.block() != null || unit.statement() != null) {

            var decl = this.declarationHandler.handleMissingContractDefinition(filename, unit)

            // add contract declaration to TU
            this.scopeManager.addDeclaration(decl)
        }

        functionsWithModifiers.forEach { k, v ->
            if (k.block() != null) {
                declarationHandler.handleModifierExpansion(k, v)
            }
        }

        return tu
    }

    override fun <T : Any?> getCodeFromRawNode(astNode: T): String? {
        if (astNode is ParserRuleContext) {

            return astNode.start.inputStream.getText(
                Interval(astNode.start.startIndex, astNode.stop.stopIndex)
            )
        } else {
            astNode?.let {
                logger.warn(
                    "Code was not added as the parsed Object {} is not of type {}",
                    it::class.simpleName,
                    ParserRuleContext::class.simpleName
                )
            }
        }
        return null
    }

    override fun <T : Any?> getLocationFromRawNode(astNode: T): PhysicalLocation? {
        if (astNode is ParserRuleContext) {
            val startToken: Token = astNode.start
            val stopToken: Token = astNode.stop
            val region =
                Region(
                    startToken.line,
                    startToken.charPositionInLine + 1,
                    stopToken.line,
                    stopToken.charPositionInLine + stopToken.text.length + 1
                ) // + 1 for sarif format
            return PhysicalLocation(currentFile!!.toURI(), region)
        } else {
            astNode?.let {
                logger.warn(
                    "PhysicalLocation was not added as the parsed Object {} is not of type {}",
                    it::class.simpleName,
                    ParserRuleContext::class.simpleName
                )
            }
        }
        return null
    }

    @ResolveInFrontend("getRecordForName")
    fun typeOf(name: String): Type {

        var type = TypeParser.createFrom(name, true, this)
        type = typeManager.registerType(type)
        // type = this.adjustType(declarator, type)

        return type
    }

    override fun <S : Any?, T : Any?> setComment(s: S, ctx: T) {}
}
