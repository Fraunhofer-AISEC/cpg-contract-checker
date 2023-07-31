package de.fraunhofer.aisec.cpg.frontends.solidity

import SolidityParser
import de.fraunhofer.aisec.cpg.frontends.Handler
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.EmitStatement
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.InlineAssemblyStatement
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.Revert
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.UncheckedStatement
import de.fraunhofer.aisec.cpg.graph.*
import de.fraunhofer.aisec.cpg.graph.statements.*
import de.fraunhofer.aisec.cpg.graph.statements.expressions.*
import org.antlr.v4.runtime.ParserRuleContext
import org.slf4j.LoggerFactory
import java.util.function.Supplier

class StatementHandler(lang: SolidityLanguageFrontend) : Handler<Statement, ParserRuleContext, SolidityLanguageFrontend>(
    Supplier { ProblemExpression() }, lang) {


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
        val statement = newReturnStatement(this.frontend.getCodeFromRawNode(ctx))

        ctx.expression()?.let { statement.returnValue = frontend.expressionHandler.handle(it) }


        return statement
    }

    private fun handleBlock(ctx: SolidityParser.BlockContext): CompoundStatement {
        val compound = newCompoundStatement(frontend.getCodeFromRawNode(ctx))

        frontend.scopeManager.enterScope(compound)

        for(stmt in ctx.statement()) {
            handle(stmt)?.let {
                compound.addStatement(it)
            }
        }

        frontend.scopeManager.leaveScope(compound)

        return compound
    }

    public fun handleMissingBlock(ctx: SolidityParser.SourceUnitContext): CompoundStatement {
        val compound = newCompoundStatement(frontend.getCodeFromRawNode(ctx))

        frontend.scopeManager.enterScope(compound)

        for(stmt in ctx.statement()) {
            handle(stmt)?.let {
                compound.addStatement(it)
            }
        }

        frontend.scopeManager.leaveScope(compound)

        return compound
    }

    private fun handleStatement(ctx: SolidityParser.StatementContext): Statement {
        ctx.ifStatement()?.let { handle(it)?.let { return it } }
        ctx.tryStatement()?.let { handle(it)?.let { return it } }
        ctx.whileStatement()?.let { handle(it)?.let { return it } }
        ctx.forStatement()?.let { handle(it)?.let { return it } }
        ctx.block()?.let { handle(it)?.let { return it } }
        ctx.inlineAssemblyStatement()?.let { handle(it)?.let { return it } }
        ctx.doWhileStatement()?.let { handle(it)?.let { return it } }
        ctx.continueStatement()?.let { handle(it)?.let { return it } }
        ctx.breakStatement()?.let { handle(it)?.let { return it } }
        ctx.returnStatement()?.let { handle(it)?.let { return it } }
        ctx.throwStatement()?.let { handle(it)?.let { return it } }
        ctx.emitStatement()?.let { handle(it)?.let { return it } }
        ctx.simpleStatement()?.let { handle(it)?.let { return it } }
        ctx.uncheckedStatement()?.let { handle(it)?.let { return it } }
        ctx.revertStatement()?.let { handle(it)?.let { return it } }
        logger.warn("Statement {} could not be parsed.", ctx::class.java)

        return newProblemExpression("Statement type not implemented for translation.", ProblemNode.ProblemType.TRANSLATION, frontend.getCodeFromRawNode(ctx),ctx)
    }

    private fun handleSimpleStatement(ctx: SolidityParser.SimpleStatementContext): Statement {
        ctx.expressionStatement()?.let { handle(it)?.let { return it } }

        ctx.variableDeclarationStatement()?.let { handle(it)?.let { return it } }

        return newProblemExpression("Statement type not implemented for translation.", ProblemNode.ProblemType.TRANSLATION, frontend.getCodeFromRawNode(ctx),ctx)
    }

    private fun handleExpressionStatement(ctx: SolidityParser.ExpressionStatementContext): Statement {
        ctx.expression()?.let {
            // unwrap expression
            var expression: Statement? = frontend.expressionHandler.handle(it)
            if(expression != null && expression is DeclaredReferenceExpression && expression.code == "_" && frontend.modifierStack.isNotEmpty()){ // TODO Is name correct here or do we need local name or code?
                var modifier = frontend.modifierStack.pop()
                frontend.currentIdentifierMapStack.push(frontend.modifierIdentifierMap[modifier])
                expression = frontend.declarationHandler.expandBodyWithModifiers(modifier)
                frontend.modifierStack.push(modifier)
                frontend.currentIdentifierMapStack.pop()

            }
            expression?.let {
                return it
            }
        }
        return newProblemExpression("Translation of Expression failed.", ProblemNode.ProblemType.TRANSLATION, frontend.getCodeFromRawNode(ctx),ctx)
    }

    private fun handleVariableDeclarationStatement(ctx: SolidityParser.VariableDeclarationStatementContext): DeclarationStatement {
        val declStatement = newDeclarationStatement(frontend.getCodeFromRawNode(ctx))

        val list = mutableListOf<SolidityParser.VariableDeclarationContext>()
        ctx.variableDeclarationList()?.let {
            list.addAll(it.variableDeclaration())
        }

        ctx.variableDeclaration()?.let {
            list += it
        }

        var initializer: Expression? = null
        ctx.expression()?.let {
            initializer = frontend.expressionHandler.handle(it)
        }

        for(variable in list) {
            val type = frontend.typeHandler.handle(variable.typeName())
            val name = variable.identifier().text

            val decl = newVariableDeclaration(name, type?: newUnknownType(), frontend.getCodeFromRawNode(variable.identifier()), false)
            decl.location = frontend.getLocationFromRawNode(variable)

            decl.initializer = initializer

            declStatement.addToPropertyEdgeDeclaration(decl)

            frontend.scopeManager.addDeclaration(decl)
        }

        return declStatement
    }

    private fun handleIfStatement(ctx: SolidityParser.IfStatementContext): IfStatement {

        val ifStatement: IfStatement = newIfStatement(frontend.getCodeFromRawNode(ctx))

        frontend.scopeManager.enterScope(ifStatement)

        ctx.expression()?.let {
            ifStatement.condition = frontend.expressionHandler.handle(it)
        }

        ctx.statement(0)?.let{
            ifStatement.thenStatement= handle(it)
        }

        ctx.statement(1)?.let{
            ifStatement.elseStatement= handle(it)
        }

        frontend.scopeManager.leaveScope(ifStatement)

        return ifStatement

    }

    private fun handleWhileStatement(ctx: SolidityParser.WhileStatementContext): WhileStatement {
        val whileStatement: WhileStatement = newWhileStatement(frontend.getCodeFromRawNode(ctx))

        frontend.scopeManager.enterScope(whileStatement)

        ctx.expression()?.let {
            whileStatement.condition = frontend.expressionHandler.handle(it)
        }

        ctx.statement()?.let{
            whileStatement.statement = handle(it)
        }

        frontend.scopeManager.leaveScope(whileStatement)

        return whileStatement
    }

    private fun handleForStatement(ctx: SolidityParser.ForStatementContext): ForStatement {
        val forStatement: ForStatement = newForStatement(frontend.getCodeFromRawNode(ctx))

        frontend.scopeManager.enterScope(forStatement)

        ctx.simpleStatement()?.let {
            forStatement.initializerStatement = handle(it)
        }

        ctx.expressionStatement()?.let{
            forStatement.condition = frontend.expressionHandler.handle(it.expression())
        }

        ctx.expression()?.let {
            forStatement.iterationStatement= frontend.expressionHandler.handle(it)
        }

        ctx.statement()?.let{
            forStatement.statement = handle(it)
        }

        frontend.scopeManager.leaveScope(forStatement)

        return forStatement
    }

    private fun handleDoWhileStatement(ctx: SolidityParser.DoWhileStatementContext): DoStatement {
        val doStatement: DoStatement= newDoStatement(frontend.getCodeFromRawNode(ctx))

        frontend.scopeManager.enterScope(doStatement)

        ctx.statement()?.let{
            doStatement.statement = handle(it)
        }

        ctx.expression()?.let {
            doStatement.condition = frontend.expressionHandler.handle(it)
        }

        frontend.scopeManager.leaveScope(doStatement)

        return doStatement
    }

    private fun handleContinueStatement(ctx: SolidityParser.ContinueStatementContext): ContinueStatement {
        return newContinueStatement(frontend.getCodeFromRawNode(ctx))
    }

    private fun handleBreakStatement(ctx: SolidityParser.BreakStatementContext): BreakStatement {
        return newBreakStatement(frontend.getCodeFromRawNode(ctx))
    }

    private fun handleInlineAssemblyStatement(ctx: SolidityParser.InlineAssemblyStatementContext): Statement {
        return InlineAssemblyStatement()
    }

    private fun handleTryStatement(ctx: SolidityParser.TryStatementContext): TryStatement {
        val tryStmt: TryStatement = newTryStatement(frontend.getCodeFromRawNode(ctx)?: "")

        // TODO look into different type of try statement

        return tryStmt
    }

    private fun handleThrowStatement(ctx: SolidityParser.ThrowStatementContext): UnaryOperator {
        return newUnaryOperator("throw", false, false, ctx.text)
    }

    private fun handleEmitStatement(ctx: SolidityParser.EmitStatementContext): Statement {
        val emit = EmitStatement()
        ctx.functionCall()?.let {
            emit.emits = frontend.expressionHandler.handle(it)
        }
        return emit
    }

    private fun handleUncheckedStatement(ctx: SolidityParser.UncheckedStatementContext): Statement {
        val uncheckedStmt = UncheckedStatement()
        uncheckedStmt.uncheckedBlock = ctx.block()?.let { handle(it) }?: null
        uncheckedStmt.code = frontend.getCodeFromRawNode(ctx)
        return uncheckedStmt
    }

    private fun handleRevertStatement(ctx: SolidityParser.RevertStatementContext): Statement {
        val revert: Revert = Revert()
        ctx.functionCall()?.let {
            revert.message = frontend.expressionHandler.handle(it) as CallExpression
        }
        return revert
    }

}