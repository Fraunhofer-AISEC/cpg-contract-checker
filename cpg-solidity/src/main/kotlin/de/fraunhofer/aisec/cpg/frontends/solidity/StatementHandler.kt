package de.fraunhofer.aisec.cpg.frontends.solidity

import de.fraunhofer.aisec.cpg.frontends.Handler
import de.fraunhofer.aisec.cpg.graph.NodeBuilder
import de.fraunhofer.aisec.cpg.graph.declarations.Declaration
import de.fraunhofer.aisec.cpg.graph.statements.CompoundStatement
import de.fraunhofer.aisec.cpg.graph.statements.Statement
import de.fraunhofer.aisec.cpg.graph.statements.expressions.Expression
import org.antlr.v4.runtime.ParserRuleContext

class StatementHandler(lang: SolidityLanguageFrontend) : Handler<Statement, ParserRuleContext, SolidityLanguageFrontend>(
    ::Statement, lang) {

    init {
        map.put(SolidityParser.BlockContext::class.java) { handleBlock(it as SolidityParser.BlockContext) }
        map.put(SolidityParser.StatementContext::class.java){ handleStatement(it as SolidityParser.StatementContext) }
        map.put(SolidityParser.SimpleStatementContext::class.java){ handleSimpleStatement(it as SolidityParser.SimpleStatementContext) }
        map.put(SolidityParser.ExpressionStatementContext::class.java){ handleExpressionStatement(it as SolidityParser.ExpressionStatementContext) }
    }

    private fun handleBlock(ctx: SolidityParser.BlockContext): CompoundStatement {
        val compound = NodeBuilder.newCompoundStatement(this.lang.getCodeFromRawNode(ctx))

        for(stmt in ctx.statement()) {
            compound.addStatement(this.handle(stmt))
        }

        return compound
    }

    private fun handleStatement(ctx: SolidityParser.StatementContext): Statement {
        ctx.simpleStatement()?.let {
            return this.handle(it)
        }

        return Statement()
    }

    private fun handleSimpleStatement(ctx: SolidityParser.SimpleStatementContext): Statement {
        ctx.expressionStatement()?.let {
            return this.handle(ctx.expressionStatement())
        }

        return Statement()
    }

    private fun handleExpressionStatement(ctx: SolidityParser.ExpressionStatementContext): Statement {
        // unwrap expression
        return this.lang.expressionHandler.handle(ctx.expression())
    }
}