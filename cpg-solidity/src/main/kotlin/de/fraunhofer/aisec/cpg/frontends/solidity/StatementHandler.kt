package de.fraunhofer.aisec.cpg.frontends.solidity

import SolidityParser
import com.github.javaparser.ast.expr.SimpleName
import com.github.javaparser.ast.stmt.BreakStmt
import de.fraunhofer.aisec.cpg.frontends.Handler
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.UncheckedStatement
import de.fraunhofer.aisec.cpg.graph.NodeBuilder
import de.fraunhofer.aisec.cpg.graph.statements.*
import de.fraunhofer.aisec.cpg.graph.statements.expressions.BinaryOperator
import de.fraunhofer.aisec.cpg.graph.statements.expressions.Expression
import org.antlr.v4.runtime.ParserRuleContext
import org.slf4j.LoggerFactory

class StatementHandler(lang: SolidityLanguageFrontend) : Handler<Statement, ParserRuleContext, SolidityLanguageFrontend>(
    ::Statement, lang) {


    private val logger = LoggerFactory.getLogger(StatementHandler::class.java)

    init {
        map.put(SolidityParser.BlockContext::class.java) { handleBlock(it as SolidityParser.BlockContext) }
        map.put(SolidityParser.StatementContext::class.java){ handleStatement(it as SolidityParser.StatementContext) }
        map.put(SolidityParser.SimpleStatementContext::class.java){ handleSimpleStatement(it as SolidityParser.SimpleStatementContext) }
        map.put(SolidityParser.ReturnStatementContext::class.java){ handleReturnStatement(it as SolidityParser.ReturnStatementContext) }
        map.put(SolidityParser.ExpressionStatementContext::class.java){ handleExpressionStatement(it as SolidityParser.ExpressionStatementContext) }
        map.put(SolidityParser.VariableDeclarationStatementContext::class.java){ handleVariableDeclarationStatement(it as SolidityParser.VariableDeclarationStatementContext) }

        map.put(SolidityParser.IfStatementContext::class.java) { handleIfStatement(it as SolidityParser.IfStatementContext) }
        map.put(SolidityParser.TryStatementContext::class.java) { handleTryStatement(it as SolidityParser.TryStatementContext) }
        map.put(SolidityParser.WhileStatementContext::class.java) { handleWhileStatement(it as SolidityParser.WhileStatementContext) }
        map.put(SolidityParser.ForStatementContext::class.java) { handleForStatement(it as SolidityParser.ForStatementContext) }
        map.put(SolidityParser.InlineAssemblyStatementContext::class.java) { handleInlineAssemblyStatement(it as SolidityParser.InlineAssemblyStatementContext) }
        map.put(SolidityParser.DoWhileStatementContext::class.java) { handleDoWhileStatement(it as SolidityParser.DoWhileStatementContext) }
        map.put(SolidityParser.ContinueStatementContext::class.java) { handleContinueStatement(it as SolidityParser.ContinueStatementContext) }
        map.put(SolidityParser.BreakStatementContext::class.java) { handleBreakStatement(it as SolidityParser.BreakStatementContext) }
        map.put(SolidityParser.ThrowStatementContext::class.java) { handleThrowStatement(it as SolidityParser.ThrowStatementContext) }
        map.put(SolidityParser.EmitStatementContext::class.java) { handleEmitStatement(it as SolidityParser.EmitStatementContext) }
        map.put(SolidityParser.UncheckedStatementContext::class.java) { handleUncheckedStatement(it as SolidityParser.UncheckedStatementContext) }
        map.put(SolidityParser.RevertStatementContext::class.java) { handleRevertStatement(it as SolidityParser.RevertStatementContext) }

    }

    private fun handleReturnStatement(ctx: SolidityParser.ReturnStatementContext): ReturnStatement {
        val statement = NodeBuilder.newReturnStatement(this.lang.getCodeFromRawNode(ctx))

        statement.returnValue = this.lang.expressionHandler.handle(ctx.expression())

        return statement
    }

    private fun handleBlock(ctx: SolidityParser.BlockContext): CompoundStatement {
        val compound = NodeBuilder.newCompoundStatement(this.lang.getCodeFromRawNode(ctx))

        lang.scopeManager.enterScope(compound)

        for(stmt in ctx.statement()) {
            compound.addStatement(this.handle(stmt))
        }

        lang.scopeManager.leaveScope(compound)

        return compound
    }

    private fun handleStatement(ctx: SolidityParser.StatementContext): Statement {
        ctx.ifStatement()?.let {
            return this.handle(it)
        }
        ctx.tryStatement()?.let {
            return this.handle(it)
        }
        ctx.whileStatement()?.let {
            return this.handle(it)
        }
        ctx.forStatement()?.let {
            return this.handle(it)
        }
        ctx.block()?.let {
            return this.handle(it)
        }
        ctx.inlineAssemblyStatement()?.let {
            return this.handle(it)
        }
        ctx.doWhileStatement()?.let {
            return this.handle(it)
        }
        ctx.continueStatement()?.let {
            return this.handle(it)
        }
        ctx.breakStatement()?.let {
            return this.handle(it)
        }
        ctx.returnStatement()?.let {
            return this.handle(it)
        }
        ctx.throwStatement()?.let {
            return this.handle(it)
        }
        ctx.emitStatement()?.let {
            return this.handle(it)
        }
        ctx.simpleStatement()?.let {
            return this.handle(it)
        }
        ctx.uncheckedStatement()?.let {
            return this.handle(it)
        }
        ctx.revertStatement()?.let {
            return this.handle(it)
        }
        logger.warn("Statement {} could not be parsed.", ctx::class.java)

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

    private fun handleIfStatement(ctx: SolidityParser.IfStatementContext): IfStatement {

        val ifStatement: IfStatement = NodeBuilder.newIfStatement(lang.getCodeFromRawNode(ctx))

        lang.scopeManager.enterScope(ifStatement)

        ctx.expression()?.let {
            ifStatement.condition = lang.expressionHandler.handle(it)
        }

        ctx.statement(0)?.let{
            ifStatement.thenStatement= handle(it)
        }

        ctx.statement(1)?.let{
            ifStatement.elseStatement= handle(it)
        }

        lang.scopeManager.leaveScope(ifStatement)

        return ifStatement

    }

    private fun handleWhileStatement(ctx: SolidityParser.WhileStatementContext): WhileStatement {
        val whileStatement: WhileStatement = NodeBuilder.newWhileStatement(lang.getCodeFromRawNode(ctx))

        lang.scopeManager.enterScope(whileStatement)

        ctx.expression()?.let {
            whileStatement.condition = lang.expressionHandler.handle(it)
        }

        ctx.statement()?.let{
            whileStatement.statement = handle(it)
        }

        lang.scopeManager.leaveScope(whileStatement)

        return whileStatement
    }

    private fun handleForStatement(ctx: SolidityParser.ForStatementContext): ForStatement {
        val forStatement: ForStatement = NodeBuilder.newForStatement(lang.getCodeFromRawNode(ctx))

        lang.scopeManager.enterScope(forStatement)

        ctx.simpleStatement()?.let {
            forStatement.initializerStatement = handle(it)
        }

        ctx.expressionStatement()?.let{
            forStatement.condition = lang.expressionHandler.handle(it.expression())
        }

        ctx.expression()?.let {
            forStatement.iterationExpression= lang.expressionHandler.handle(it)
        }

        ctx.statement()?.let{
            forStatement.statement = handle(it)
        }

        lang.scopeManager.leaveScope(forStatement)

        return forStatement
    }

    private fun handleDoWhileStatement(ctx: SolidityParser.DoWhileStatementContext): DoStatement {
        val doStatement: DoStatement= NodeBuilder.newDoStatement(lang.getCodeFromRawNode(ctx))

        lang.scopeManager.enterScope(doStatement)

        ctx.statement()?.let{
            doStatement.statement = handle(it)
        }

        ctx.expression()?.let {
            doStatement.condition = lang.expressionHandler.handle(it)
        }

        lang.scopeManager.leaveScope(doStatement)

        return doStatement
    }

    private fun handleContinueStatement(ctx: SolidityParser.ContinueStatementContext): ContinueStatement {
        return NodeBuilder.newContinueStatement(lang.getCodeFromRawNode(ctx))
    }

    private fun handleBreakStatement(ctx: SolidityParser.BreakStatementContext): BreakStatement {
        return NodeBuilder.newBreakStatement(lang.getCodeFromRawNode(ctx))
    }

    private fun handleInlineAssemblyStatement(ctx: SolidityParser.InlineAssemblyStatementContext): Statement {
        // TODO implement
        return Statement()
    }

    private fun handleTryStatement(ctx: SolidityParser.TryStatementContext): TryStatement {
        val tryStmt: TryStatement = NodeBuilder.newTryStatement(lang.getCodeFromRawNode(ctx)?: "")

        // TODO look into different type of try statement

        return tryStmt
    }

    private fun handleThrowStatement(ctx: SolidityParser.ThrowStatementContext): BinaryOperator {
        // TODO implement
        return BinaryOperator()
    }

    private fun handleEmitStatement(ctx: SolidityParser.EmitStatementContext): Statement {
        // TODO implement
        return Statement()
    }

    private fun handleUncheckedStatement(ctx: SolidityParser.UncheckedStatementContext): Statement {
        val uncheckedStmt = UncheckedStatement()
        ctx.block()?.let { uncheckedStmt.uncheckedBlock = handle(it) }
        return uncheckedStmt
    }

    private fun handleRevertStatement(ctx: SolidityParser.RevertStatementContext): Statement {
        // TODO implement
        return Statement()
    }

}