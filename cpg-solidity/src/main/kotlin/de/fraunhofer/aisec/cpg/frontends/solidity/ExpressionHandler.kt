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

import SolidityParser
import de.fraunhofer.aisec.cpg.frontends.Handler
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.Require
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.Revert
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.SpecifiedExpression
import de.fraunhofer.aisec.cpg.graph.*
import de.fraunhofer.aisec.cpg.graph.statements.expressions.*
import de.fraunhofer.aisec.cpg.graph.types.Type
import de.fraunhofer.aisec.cpg.graph.types.TypeParser
import de.fraunhofer.aisec.cpg.graph.types.UnknownType
import java.util.function.Supplier
import org.antlr.v4.runtime.ParserRuleContext
import org.antlr.v4.runtime.tree.ParseTree
import org.antlr.v4.runtime.tree.TerminalNode
import org.slf4j.LoggerFactory

class ExpressionHandler(lang: SolidityLanguageFrontend) :
    Handler<Expression, ParserRuleContext, SolidityLanguageFrontend>(
        Supplier { ProblemExpression() },
        lang
    ) {

    private var replacingReferenceWithExpression: Boolean = false

    private val baseTypes: MutableSet<String> =
        mutableSetOf<String>(
            "bool",
            "int",
            "uint",
            "fixed",
            "ufixed",
            "address",
            " address payable",
            "bytes",
            "string"
        )

    private val logger = LoggerFactory.getLogger(ExpressionHandler::class.java)

    init {
        map.put(SolidityParser.ExpressionContext::class.java) {
            handleExpression(it as SolidityParser.ExpressionContext)
        }
        map.put(SolidityParser.PrimaryExpressionContext::class.java) {
            handlePrimaryExpression(it as SolidityParser.PrimaryExpressionContext)
        }
        map.put(SolidityParser.FunctionCallContext::class.java) {
            handleFunctionCall(it as SolidityParser.FunctionCallContext)
        }
        map.put(SolidityParser.NameValueListContext::class.java) {
            handleNameValueListExpression(it as SolidityParser.NameValueListContext)
        }
        map.put(SolidityParser.IdentifierContext::class.java) {
            handleIdentifier(it as SolidityParser.IdentifierContext)
        }

        // Adding all signed and unsigned integer type strings
        for (i in 8..256 step 8) {
            baseTypes.addAll(setOf("uint$i", "int$i"))
        }
    }

    private fun isType(type: String): Boolean {
        var name = type
        while (name.endsWith("]")) {
            name = type.substring(0, type.lastIndexOf('['))
        }

        if (name in baseTypes) return true
        if (name.startsWith("uint")) {
            name.substring(4).toIntOrNull()?.let {
                return (8..256 step 8).contains(it)
            }
        }
        if (name.startsWith("int")) {
            name.substring(3).toIntOrNull()?.let {
                return (8..256 step 8).contains(it)
            }
        }

        if (name.startsWith("bytes")) {
            name.substring(5).toIntOrNull()?.let {
                return (1..32).contains(it)
            }
        }

        if (name.startsWith("fixed")) {
            name.substring(5)?.let {
                val comps = it.split("x")
                if (
                    comps.size == 2 &&
                        (8..256 step 8).contains(comps[0].toIntOrNull()) &&
                        (0..80).contains(comps[1].toIntOrNull())
                ) {
                    return true
                }
            }
        }

        if (name.startsWith("ufixed")) {
            name.substring(6)?.let {
                val comps = it.split("x")
                if (
                    comps.size == 2 &&
                        (8..256 step 8).contains(comps[0].toIntOrNull()) &&
                        (0..80).contains(comps[1].toIntOrNull())
                ) {
                    return true
                }
            }
        }
        return false
    }

    private fun handleNameValueListExpression(
        ctx: SolidityParser.NameValueListContext
    ): Expression {
        val exp = newExpressionList(frontend.getCodeFromRawNode(ctx), ctx)

        for (nameValue in ctx.nameValue()) {
            val keyValue = KeyValueExpression()
            keyValue.key = handle(nameValue.identifier())
            keyValue.value = handle(nameValue.expression())
            exp.addExpression(keyValue)
        }
        return exp
    }

    private fun handleExpression(ctx: SolidityParser.ExpressionContext): Expression {
        val expressions = ctx.expression()

        // a primary expression, e.g. a reference or a literal
        ctx.primaryExpression()?.let {
            this.handle(it)?.let {
                return it
            }
        }

        // check for an operator
        val terminalNodes: List<ParseTree> = ctx.children.filter { it is TerminalNode }
        val op = terminalNodes.get(0)

        // member access
        if (op != null && op.text.trim() == ".") {
            val base = this.handle(expressions.first())
            base?.let {
                val name = ctx.identifier()?.text?.trim() ?: ctx.text.trim()
                val type =
                    if (
                        base.type.name.toString().equals("address") &&
                            TypeHandler.addressExtenderMembers.contains(name)
                    ) {
                        TypeHandler.getAddressType(language, frontend.ctx)
                    } else {
                        TypeHandler.getPredefinedTypes(ctx.text.trim(), language, frontend.ctx)
                    }
                val memberExpression =
                    newMemberExpression(
                        name,
                        base,
                        type,
                        operatorCode = op.text.trim(),
                        code = frontend.getCodeFromRawNode(ctx),
                        rawNode = ctx
                    )
                if (
                    TypeHandler.addressExtenderMembers.contains(name) &&
                        base.type.equals(UnknownType.getUnknownType(language))
                ) {
                    base.registerTypeListener(
                        object : HasType.TypeListener {
                            override fun typeChanged(
                                src: HasType,
                                root: MutableList<HasType>,
                                oldType: Type
                            ) {
                                if (src.type.name.toString().equals("address")) {
                                    memberExpression.type =
                                        TypeHandler.getAddressType(language, frontend.ctx)
                                }
                            }

                            override fun possibleSubTypesChanged(
                                src: HasType,
                                root: MutableList<HasType>
                            ) {}
                        }
                    )
                }
                return memberExpression
            }
        }

        if (
            terminalNodes.size == 2 &&
                "[".equals(terminalNodes[0].text.trim()) &&
                "]".equals(terminalNodes[1].text.trim())
        ) {
            val arraySub = newArraySubscriptionExpression(frontend.getCodeFromRawNode(ctx), ctx)
            this.handle(expressions[0])?.let { arraySub.arrayExpression = it }
            this.handle(expressions[1])?.let { arraySub.subscriptExpression = it }

            return arraySub
        }

        if (
            terminalNodes.size == 2 &&
                "?".equals(terminalNodes[0].text.trim()) &&
                ":".equals(terminalNodes[1].text.trim())
        ) {
            return newConditionalExpression(
                this.handle(expressions[0])!!,
                this.handle(expressions[1]),
                this.handle(expressions[2]),
                code = frontend.getCodeFromRawNode(ctx),
                rawNode = ctx
            )
        }

        if (
            terminalNodes.size == 3 &&
                "[".equals(terminalNodes[0].text.trim()) &&
                ":".equals(terminalNodes[1].text.trim()) &&
                "]".equals(terminalNodes[2])
        ) {
            return newRangeExpression(
                this.handle(expressions[0]),
                this.handle(expressions[1]),
                frontend.getCodeFromRawNode(ctx)
            )
        }

        // either a function call or a construct expression
        if (ctx.functionCallArguments() != null) {
            var ref = this.handle(expressions.first())

            if (ref is DeclaredReferenceExpression || ref is SpecifiedExpression) {
                var name: Name? = null
                var fqn: String? = null
                if (ref is DeclaredReferenceExpression) {
                    name = ref.name
                    fqn = name.toString()
                } else if (ref is SpecifiedExpression) {
                    var nameHolder = ref
                    while (nameHolder is SpecifiedExpression) {
                        nameHolder = nameHolder.expression
                    }
                    name = nameHolder?.name
                    fqn = name?.toString()
                }

                var call: CallExpression = CallExpression()

                name?.let {
                    fqn?.let {
                        // use the scope manager instead
                        val record =
                            frontend.scopeManager.currentRecord?.records?.firstOrNull {
                                it.name == name
                            }

                        call =
                            if (record != null) {
                                newConstructExpression(frontend.getCodeFromRawNode(ctx))
                            } else {
                                newCallExpression(
                                    ref,
                                    fqn,
                                    frontend.getCodeFromRawNode(ctx),
                                    false,
                                    ctx
                                )
                            }

                        for (arg in
                            ctx.functionCallArguments()?.expressionList()?.expression()
                                ?: listOf()) {
                            this.handle(arg)?.let { call.addArgument(it) }
                        }

                        if (
                            call.name.localName.equals("revert") &&
                                call.arguments.size == 1 &&
                                call.arguments[0] is Literal<*>
                        ) {
                            val revertStatement: Revert = Revert()
                            revertStatement.message = call.arguments[0]
                            return revertStatement
                        }

                        if (
                            call.name.localName.equals("require") &&
                                call.arguments.size >= 1 &&
                                call.arguments.size <= 2
                        ) {
                            val require: Require = Require()
                            require.condition = call.arguments[0]
                            if (call.arguments.size > 2) {
                                require.message = call.arguments[1]
                            }
                            return require
                        }
                    }
                }
                ref?.let { call.callee = ref }
                // call.callee
                // var base = expressions.first()
                // while (base.nameValueList() != null) {
                //    base = base.expression().first()
                // }
                // if(base.expression().isNotEmpty()){
                //    call.callee =this.handle(expressions.first().expression()[0])
                // }

                return call
            } else if (ref is CallExpression) {
                return ref
            } else if (
                isType(ref?.code ?: "") || frontend.declaredTypes.contains(ref?.code ?: "")
            ) {
                var cast = newCastExpression(frontend.getCodeFromRawNode(ctx))
                val args = ctx.functionCallArguments()?.expressionList()?.expression() ?: listOf()
                if (args.size == 1) {
                    this.handle(args[0])?.let { cast.expression = it }
                    cast.castType =
                        TypeParser.createFrom(ref?.code ?: "", language, false, frontend.ctx)
                    // cast.castType = ObjectType(ref.code, Type.Storage.AUTO,
                    // Type.Qualifier(false,false,false,false),
                    // listOf(), ObjectType.Modifier.NOT_APPLICABLE,
                    // !lang.declaredTypes.contains(ref.code?:""))
                    return cast
                }
            }

            logger.warn("Expression {} could not be parsed.", ctx::class.java)

            return newProblemExpression(
                "This expression with arguments could not be translated into a CPG-construct",
                ProblemNode.ProblemType.TRANSLATION,
                frontend.getCodeFromRawNode(ctx),
                ctx
            )
        }

        if (ctx.nameValueList() != null) {
            val exp = this.handle(ctx.expression().first())

            val specExpression = SpecifiedExpression()

            specExpression.expression = exp

            specExpression.specifiers = this.handle(ctx.nameValueList()!!) as ExpressionList

            return specExpression
        }

        // unary expression
        if (op != null && expressions.size == 1) {
            val postfix = ctx.children.lastOrNull() is TerminalNode
            val prefix = ctx.children.firstOrNull() is TerminalNode

            val unary =
                newUnaryOperator(op.text.trim(), postfix, prefix, frontend.getCodeFromRawNode(ctx))

            handle(expressions[0])?.let {
                unary.input = it
                return unary
            }

            return unary
        }

        // binary expression
        if (op != null && expressions.size == 2) {
            val binOp = newBinaryOperator(op.text.trim(), frontend.getCodeFromRawNode(ctx))

            handle(expressions[0])?.let { binOp.lhs = it }
            handle(expressions[1])?.let { binOp.rhs = it }

            return binOp
        }

        logger.warn("Expression {} could not be parsed.", ctx::class.java)

        return newProblemExpression(
            "This expression was not correctly translated",
            ProblemNode.ProblemType.TRANSLATION,
            frontend.getCodeFromRawNode(ctx),
            ctx
        )
    }

    private fun handleFunctionCall(ctx: SolidityParser.FunctionCallContext): CallExpression {
        val call: CallExpression = CallExpression()

        // either a function call or a construct expression
        if (ctx.functionCallArguments() != null) {
            val ref = this.handle(ctx.expression())

            if (ref is DeclaredReferenceExpression) {
                val name = ref.name
                val fqn = name

                // use the scope manager instead
                val record =
                    frontend.scopeManager.currentRecord?.records?.firstOrNull { it.name == name }

                val call =
                    if (record != null) {
                        newConstructExpression(frontend.getCodeFromRawNode(ctx))
                    } else {
                        newCallExpression(ref, fqn, frontend.getCodeFromRawNode(ctx), false)
                    }

                for (arg in
                    ctx.functionCallArguments()?.expressionList()?.expression() ?: listOf()) {
                    handle(arg)?.let { call.addArgument(it) }
                }

                return call
            }
        }
        return call
    }

    private fun handleIdentifier(ctx: SolidityParser.IdentifierContext): Expression {
        val name = ctx.text.trim()
        // replacing identifier to reference conversion by replacing them with the expression in the
        // modifier invocation
        // != null represents the case where the modifier is the actual base function
        if (
            !replacingReferenceWithExpression &&
                frontend.currentIdentifierMapStack.isNotEmpty() &&
                frontend.currentIdentifierMapStack.peek() != null
        ) {
            replacingReferenceWithExpression = true
            val expression: SolidityParser.ExpressionContext? =
                getExpressionMatchingIdentifier(frontend.currentIdentifierMapStack.peek(), name)

            if (expression != null) {
                val cpgExpression = handle(expression)
                replacingReferenceWithExpression = false
                return cpgExpression!!
            }
            replacingReferenceWithExpression = false
        }

        val type = TypeHandler.getPredefinedTypes(name, language, frontend.ctx)

        val ref = newDeclaredReferenceExpression(name, type, frontend.getCodeFromRawNode(ctx))
        return ref
    }

    private fun getExpressionMatchingIdentifier(
        map: MutableMap<String, SolidityParser.ExpressionContext>,
        name: String
    ): SolidityParser.ExpressionContext? {
        map?.let {
            return map[name]
        }
        return null
    }

    private fun handlePrimaryExpression(ctx: SolidityParser.PrimaryExpressionContext): Expression {
        ctx.identifier()?.let {
            handle(it)?.let {
                return it
            }
        }

        ctx.numberLiteral()?.let {
            it.DecimalNumber()?.text?.trim()?.let {
                val value = it.toIntOrNull() ?: it.toLongOrNull() ?: it.toDoubleOrNull() ?: null
                val type =
                    when (value) {
                        is Int -> TypeParser.createFrom("int", language, false, frontend.ctx)
                        is Long -> TypeParser.createFrom("long", language, false, frontend.ctx)
                        is Double -> TypeParser.createFrom("double", language, false, frontend.ctx)
                        else -> newUnknownType()
                    }
                return newLiteral(value, type, frontend.getCodeFromRawNode(ctx.numberLiteral()))
            }

            it.HexNumber()?.text?.trim().let {
                return newLiteral(
                    it,
                    TypeParser.createFrom("bytes", language, false, frontend.ctx),
                    it
                )
            }

            val value = Integer.valueOf(it.DecimalNumber().text.trim())
            val literal =
                newLiteral(
                    value,
                    TypeParser.createFrom("int", language, false, frontend.ctx),
                    frontend.getCodeFromRawNode(it)
                )

            return literal
        }

        ctx.BooleanLiteral()?.let {
            val value =
                when (it.text.trim()) {
                    "true" -> true
                    else -> false
                }
            return newLiteral<Boolean>(
                value,
                TypeParser.createFrom("bool", language, false, frontend.ctx),
                it.text.trim()
            )
        }

        ctx.stringLiteral()?.let {
            return newLiteral(
                it.text.trim(),
                TypeParser.createFrom("string", language, false, frontend.ctx),
                it.text.trim()
            )
        }

        ctx.tupleExpression()?.let {}

        ctx.PayableKeyword()?.let {}

        ctx.TypeKeyword()?.let {}

        ctx.typeName()?.let {}

        return newProblemExpression(
            "No translation for this primary expression was found",
            ProblemNode.ProblemType.TRANSLATION,
            frontend.getCodeFromRawNode(ctx),
            ctx
        )
    }
}
