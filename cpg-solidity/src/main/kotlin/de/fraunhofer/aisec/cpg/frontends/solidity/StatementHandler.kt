package de.fraunhofer.aisec.cpg.frontends.solidity

import de.fraunhofer.aisec.cpg.frontends.Handler
import de.fraunhofer.aisec.cpg.graph.NodeBuilder
import de.fraunhofer.aisec.cpg.graph.declarations.Declaration
import de.fraunhofer.aisec.cpg.graph.statements.CompoundStatement
import de.fraunhofer.aisec.cpg.graph.statements.DeclarationStatement
import de.fraunhofer.aisec.cpg.graph.statements.ReturnStatement
import de.fraunhofer.aisec.cpg.graph.statements.Statement
import de.fraunhofer.aisec.cpg.graph.statements.expressions.Expression
import org.antlr.v4.runtime.ParserRuleContext

class StatementHandler(lang: SolidityLanguageFrontend) : Handler<Statement, ParserRuleContext, SolidityLanguageFrontend>(
    ::Statement, lang) {

    init {
        map.put(SolidityParser.BlockContext::class.java) { handleBlock(it as SolidityParser.BlockContext) }
        map.put(SolidityParser.StatementContext::class.java){ handleStatement(it as SolidityParser.StatementContext) }
        map.put(SolidityParser.SimpleStatementContext::class.java){ handleSimpleStatement(it as SolidityParser.SimpleStatementContext) }
        map.put(SolidityParser.ReturnStatementContext::class.java){ handleReturnStatement(it as SolidityParser.ReturnStatementContext) }
        map.put(SolidityParser.ExpressionStatementContext::class.java){ handleExpressionStatement(it as SolidityParser.ExpressionStatementContext) }
        map.put(SolidityParser.VariableDeclarationStatementContext::class.java){ handleVariableDeclarationStatement(it as SolidityParser.VariableDeclarationStatementContext) }
    }

    private fun handleReturnStatement(ctx: SolidityParser.ReturnStatementContext): ReturnStatement {
        val statement = NodeBuilder.newReturnStatement(this.lang.getCodeFromRawNode(ctx))

        statement.returnValue = this.lang.expressionHandler.handle(ctx.expression())

        return statement
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

        ctx.returnStatement()?.let {
            return this.handle(it)
        }

        return Statement()
    }

    private fun handleSimpleStatement(ctx: SolidityParser.SimpleStatementContext): Statement {
        ctx.expressionStatement()?.let {
            return this.handle(ctx.expressionStatement())
        }

        ctx.variableDeclarationStatement()?.let {
            return this.handle(ctx.variableDeclarationStatement())
        }

        return Statement()
    }

    private fun handleExpressionStatement(ctx: SolidityParser.ExpressionStatementContext): Statement {
        // unwrap expression
        return this.lang.expressionHandler.handle(ctx.expression())
    }

    private fun handleVariableDeclarationStatement(ctx: SolidityParser.VariableDeclarationStatementContext): DeclarationStatement {
        val declStatement = NodeBuilder.newDeclarationStatement(this.lang.getCodeFromRawNode(ctx))

        val list = mutableListOf<SolidityParser.VariableDeclarationContext>()
        ctx.variableDeclarationList()?.let {
            list.addAll(it.variableDeclaration())
        }

        ctx.variableDeclaration()?.let {
            list += it
        }

        var initializer: Expression? = null
        ctx.expression()?.let {
            initializer = this.lang.expressionHandler.handle(it)
        }

        for(variable in list) {
            val type = this.lang.typeHandler.handle(variable.typeName())
            val name = variable.identifier().text

            val decl =
                NodeBuilder.newVariableDeclaration(name, type, this.lang.getCodeFromRawNode(variable.identifier()), false)

            decl.initializer = initializer

            declStatement.addToPropertyEdgeDeclaration(decl)

            this.lang.scopeManager.addDeclaration(decl)
        }

        return declStatement
    }

}