package de.fraunhofer.aisec.cpg.frontends.solidity

import de.fraunhofer.aisec.cpg.frontends.Handler
import de.fraunhofer.aisec.cpg.graph.NodeBuilder
import de.fraunhofer.aisec.cpg.graph.declarations.Declaration
import de.fraunhofer.aisec.cpg.graph.statements.expressions.Expression
import de.fraunhofer.aisec.cpg.graph.types.TypeParser
import de.fraunhofer.aisec.cpg.graph.types.UnknownType
import org.antlr.v4.runtime.ParserRuleContext
import org.antlr.v4.runtime.tree.TerminalNode

class ExpressionHandler(lang: SolidityLanguageFrontend) : Handler<Expression, ParserRuleContext, SolidityLanguageFrontend>(
    ::Expression, lang) {

    init {
        map.put(SolidityParser.ExpressionContext::class.java) { handleExpression(it as SolidityParser.ExpressionContext) }
        map.put(SolidityParser.PrimaryExpressionContext::class.java) { handlePrimaryExpression(it as SolidityParser.PrimaryExpressionContext) }
    }

    private fun handleExpression(ctx: SolidityParser.ExpressionContext): Expression {
        val expressions = ctx.expression()

        // a primary expression, e.g. a reference or a literal
        ctx.primaryExpression()?.let {
            return this.handle(it)
        }

        // binary expression
        if(expressions.size == 2) {
            // retrieve the operator
            val op = ctx.getChild(TerminalNode::class.java, 0).text

            val binOp = NodeBuilder.newBinaryOperator(op, this.lang.getCodeFromRawNode(ctx))

            binOp.lhs = this.handleExpression(expressions[0])
            binOp.rhs = this.handleExpression(expressions[1])

            return binOp
        }

        return Expression()
    }

    private fun handlePrimaryExpression(ctx: SolidityParser.PrimaryExpressionContext): Expression {
        ctx.identifier()?.let {
            val name = it.text
            val ref = NodeBuilder.newDeclaredReferenceExpression(name,
                UnknownType.getUnknownType(),
                this.lang.getCodeFromRawNode(it))

            return ref
        }

        ctx.numberLiteral()?.let {
            // TODO: support hex literal
            val value = Integer.valueOf(it.DecimalNumber().text)
            val literal = NodeBuilder.newLiteral(value,
                TypeParser.createFrom("int", false),
                this.lang.getCodeFromRawNode(it)
            )
            
            return literal
        }

        return Expression()
    }
}