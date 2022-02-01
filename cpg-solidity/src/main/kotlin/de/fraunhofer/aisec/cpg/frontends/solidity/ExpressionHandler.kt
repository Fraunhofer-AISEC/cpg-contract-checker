package de.fraunhofer.aisec.cpg.frontends.solidity

import SolidityParser
import de.fraunhofer.aisec.cpg.frontends.Handler
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.Require
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.Revert
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.SpecifiedExpression
import de.fraunhofer.aisec.cpg.graph.NodeBuilder
import de.fraunhofer.aisec.cpg.graph.statements.expressions.*
import de.fraunhofer.aisec.cpg.graph.types.TypeParser
import de.fraunhofer.aisec.cpg.graph.types.UnknownType
import org.antlr.v4.runtime.ParserRuleContext
import org.antlr.v4.runtime.tree.TerminalNode
import org.slf4j.LoggerFactory

class ExpressionHandler(lang: SolidityLanguageFrontend) : Handler<Expression, ParserRuleContext, SolidityLanguageFrontend>(
    ::Expression, lang) {

    private val logger = LoggerFactory.getLogger(ExpressionHandler::class.java)

    init {
        map.put(SolidityParser.ExpressionContext::class.java) { handleExpression(it as SolidityParser.ExpressionContext) }
        map.put(SolidityParser.PrimaryExpressionContext::class.java) { handlePrimaryExpression(it as SolidityParser.PrimaryExpressionContext) }
        map.put(SolidityParser.FunctionCallContext::class.java) { handleFunctionCall(it as SolidityParser.FunctionCallContext) }
        map.put(SolidityParser.NameValueListContext::class.java) {handleNameValueListExpression(it as SolidityParser.NameValueListContext)}
        map.put(SolidityParser.IdentifierContext::class.java) {handleIdentifier(it as SolidityParser.IdentifierContext)}
    }

    private fun handleNameValueListExpression(ctx: SolidityParser.NameValueListContext): Expression {
        val exp = NodeBuilder.newExpressionList(lang.getCodeFromRawNode(ctx))

        for(nameValue in ctx.nameValue()){
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
            return this.handle(it)
        }

        // check for an operator
        val op = ctx.getChild(TerminalNode::class.java, 0)

        // member access
        if(op != null && op.text == ".") {
            val base = this.handle(expressions.first())
            val name = ctx.identifier().text

            val member = NodeBuilder.newMemberExpression(base, UnknownType.getUnknownType(), name, op.text, this.lang.getCodeFromRawNode(ctx))

            return member
        }

        // either a function call or a construct expression
        if(ctx.functionCallArguments() != null) {
            var ref = this.handle(ctx.expression().firstOrNull())


            if(ref is DeclaredReferenceExpression || ref is SpecifiedExpression){
                var name: String? = null;
                var fqn: String? = null;
                if(ref is DeclaredReferenceExpression){
                    name = ref.name
                    fqn = name
                }else if(ref is SpecifiedExpression){
                    while(ref is SpecifiedExpression){
                        ref = ref.expression
                    }
                    name = ref.name
                    fqn = name
                }

                var call:CallExpression = CallExpression()

                name?.let {
                    fqn?.let {
                        // TODO: use the scope manager instead
                        val record = this.lang.scopeManager.currentRecord?.records?.firstOrNull { it.name == name }

                        call = if(record != null) {
                            NodeBuilder.newConstructExpression(this.lang.getCodeFromRawNode(ctx))
                        } else {
                            NodeBuilder.newCallExpression(name, fqn, this.lang.getCodeFromRawNode(ctx), false)
                        }

                        for(arg in ctx.functionCallArguments()?.expressionList()?.expression() ?: listOf()) {
                            call.addArgument(this.handle(arg))
                        }

                        if(call.name.equals("revert") && call.arguments.size == 1 && call.arguments[0] is Literal<*>){
                            val revertStatement: Revert = Revert()
                            revertStatement.message = call.arguments[0]
                            return revertStatement
                        }

                        if(call.name.equals("require") && call.arguments.size >= 1  && call.arguments.size <= 2){
                            val require: Require = Require()
                            require.condition = call.arguments[0]
                            if(call.arguments.size > 2){
                                require.message = call.arguments[1]
                            }
                            return require
                        }
                    }
                }



                return call
            }


            logger.warn("Expression {} could not be parsed.", ctx::class.java)

            return Expression()
        }

        if(ctx.nameValueList() != null){
            val exp = this.handle(ctx.expression().firstOrNull())

            val specExpression = SpecifiedExpression()

            specExpression.expression = exp

            specExpression.specifiers = this.handle(ctx.nameValueList()!!) as ExpressionList

            return specExpression
        }

        // unary expression
        if(op != null && expressions.size == 1) {
            val postfix = ctx.children.lastOrNull() is TerminalNode
            val prefix = ctx.children.firstOrNull() is TerminalNode

            val unary = NodeBuilder.newUnaryOperator(op.text, postfix, prefix, this.lang.getCodeFromRawNode(ctx))

            return unary
        }

        // binary expression
        if(op != null && expressions.size == 2) {
            val binOp = NodeBuilder.newBinaryOperator(op.text, this.lang.getCodeFromRawNode(ctx))

            binOp.lhs = this.handle(expressions[0])
            binOp.rhs = this.handle(expressions[1])

            return binOp
        }


        logger.warn("Expression {} could not be parsed.", ctx::class.java)

        return Expression()
    }

    private fun handleFunctionCall(ctx: SolidityParser.FunctionCallContext): CallExpression {
        val call: CallExpression = CallExpression()

        // either a function call or a construct expression
        if (ctx.functionCallArguments() != null) {
            val ref = this.handle(ctx.expression())

            if (ref is DeclaredReferenceExpression) {
                val name = ref.name
                val fqn = name

                // TODO: use the scope manager instead
                val record = this.lang.scopeManager.currentRecord?.records?.firstOrNull { it.name == name }

                val call = if (record != null) {
                    NodeBuilder.newConstructExpression(this.lang.getCodeFromRawNode(ctx))
                } else {
                    NodeBuilder.newCallExpression(ref.name, fqn, this.lang.getCodeFromRawNode(ctx), false)
                }

                for (arg in ctx.functionCallArguments()?.expressionList()?.expression() ?: listOf()) {
                    call.addArgument(this.handle(arg))
                }

                return call
            }
        }
        return call
    }

    private fun handleIdentifier(ctx: SolidityParser.IdentifierContext) : Expression {
        val name = ctx.text
        val ref = NodeBuilder.newDeclaredReferenceExpression(name,
            UnknownType.getUnknownType(),
            this.lang.getCodeFromRawNode(ctx))
        return ref
    }

    private fun handlePrimaryExpression(ctx: SolidityParser.PrimaryExpressionContext): Expression {
        ctx.identifier()?.let {
            return handle(it)
        }

        ctx.numberLiteral()?.let {

            it.DecimalNumber()?.text?.let {
                val value = it.toIntOrNull() ?: it.toLongOrNull() ?: it.toDoubleOrNull() ?: null
                val type = when(value){
                    is Int -> TypeParser.createFrom("int", false)
                    is Long -> TypeParser.createFrom("long", false)
                    is Double -> TypeParser.createFrom("double", false)
                    else -> UnknownType.getUnknownType()
                }
                return NodeBuilder.newLiteral(value, type, this.lang.getCodeFromRawNode(ctx.numberLiteral()))
            }

            it.HexNumber()?.text.let {
                return NodeBuilder.newLiteral(it, TypeParser.createFrom("", true), it)
            }

            val value = Integer.valueOf(it.DecimalNumber().text)
            val literal = NodeBuilder.newLiteral(value,
                TypeParser.createFrom("int", false),
                this.lang.getCodeFromRawNode(it)
            )
            
            return literal
        }

        ctx.BooleanLiteral()?.let {
            val value = when(it.text){
                "true" -> true
                else -> false
            }
            return NodeBuilder.newLiteral<Boolean>(value, TypeParser.createFrom("bool", true), it.text)
        }

        ctx.stringLiteral()?.let {
            return NodeBuilder.newLiteral(it.text, TypeParser.createFrom("string", true), it.text)
        }


        ctx.tupleExpression()?.let {

        }

        ctx.PayableKeyword()?.let {

        }

        ctx.TypeKeyword()?.let {

        }

        ctx.typeNameExpression()?.let {

        }

        return Expression()
    }
}