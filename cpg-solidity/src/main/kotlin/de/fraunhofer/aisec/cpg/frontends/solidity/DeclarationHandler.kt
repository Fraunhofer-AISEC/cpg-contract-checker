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
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.ModifierDefinition
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.PragmaDeclaration
import de.fraunhofer.aisec.cpg.graph.*
import de.fraunhofer.aisec.cpg.graph.declarations.*
import de.fraunhofer.aisec.cpg.graph.statements.CompoundStatement
import de.fraunhofer.aisec.cpg.graph.statements.Statement
import de.fraunhofer.aisec.cpg.graph.statements.expressions.BinaryOperator
import de.fraunhofer.aisec.cpg.graph.statements.expressions.DeclaredReferenceExpression
import de.fraunhofer.aisec.cpg.graph.statements.expressions.Expression
import de.fraunhofer.aisec.cpg.graph.types.Type
import de.fraunhofer.aisec.cpg.graph.types.TypeParser
import de.fraunhofer.aisec.cpg.graph.types.UnknownType
import de.fraunhofer.aisec.cpg.helpers.SubgraphWalker
import java.util.*
import java.util.function.Supplier
import org.antlr.v4.runtime.ParserRuleContext
import org.slf4j.LoggerFactory

class DeclarationHandler(lang: SolidityLanguageFrontend) :
    Handler<Declaration, ParserRuleContext, SolidityLanguageFrontend>(
        Supplier { ProblemDeclaration() },
        lang
    ) {

    private val logger = LoggerFactory.getLogger(DeclarationHandler::class.java)

    var methodId = 0

    init {
        map.put(SolidityParser.ContractDefinitionContext::class.java) {
            handleContractDefinition(it as SolidityParser.ContractDefinitionContext)
        }
        map.put(SolidityParser.FunctionDefinitionContext::class.java) {
            handleFunctionDefinition(it as SolidityParser.FunctionDefinitionContext)
        }
        map.put(SolidityParser.ParameterContext::class.java) {
            handleParameter(it as SolidityParser.ParameterContext)
        }
        map.put(SolidityParser.StateVariableDeclarationContext::class.java) {
            handleStateVariableDeclaration(it as SolidityParser.StateVariableDeclarationContext)
        }
        map.put(SolidityParser.VariableDeclarationContext::class.java) {
            handleVariableDeclaration(it as SolidityParser.VariableDeclarationContext)
        }
        map.put(SolidityParser.StructDefinitionContext::class.java) {
            handleStructDefinition(it as SolidityParser.StructDefinitionContext)
        }
        map.put(SolidityParser.ModifierDefinitionContext::class.java) {
            handleModifierDefinition(it as SolidityParser.ModifierDefinitionContext)
        }
        // map.put(SolidityParser.PragmaDirectiveContext::class.java)
        // {handlePragmaDirectiveContext(it as SolidityParser.PragmaDirectiveContext)}
    }

    private fun handlePragmaDirectiveContext(
        ctx: SolidityParser.PragmaDirectiveContext
    ): Declaration {
        val d: PragmaDeclaration = PragmaDeclaration()
        d.applyMetadata(this, ctx.pragmaName().text?.trim(), ctx, ctx.text?.trim())
        ctx.pragmaValue()?.version()?.let {
            for (versionC in it.versionConstraint()) {
                val b = BinaryOperator()
                b.operatorCode = "="
                versionC.versionOperator()?.let { b.operatorCode = it.text }
                // Capture ^ under ==
                versionC.VersionLiteral()?.let {
                    b.rhs =
                        newLiteral(
                            it.text?.trim(),
                            TypeParser.createFrom("string", true, frontend),
                            it.text?.trim()
                        )
                }
                versionC.DecimalNumber()?.let {
                    b.rhs =
                        newLiteral(
                            it.text?.trim(),
                            TypeParser.createFrom("string", true, frontend),
                            it.text?.trim()
                        )
                }
                newDeclaredReferenceExpression(
                    "version",
                    UnknownType.getUnknownType(language),
                    frontend.getCodeFromRawNode(ctx)
                )

                d.expressions.add(b)
            }
        }

        return d
    }

    private fun handleStructDefinition(ctx: SolidityParser.StructDefinitionContext): Declaration {
        val name = ctx.identifier()?.text?.trim() ?: ""

        val record = newRecordDeclaration(name, "struct", frontend.getCodeFromRawNode(ctx))
        frontend.declaredTypes.put(name, record)

        frontend.scopeManager.enterScope(record)

        for (`var` in ctx.variableDeclaration() ?: listOf()) {
            val declaration = handle(`var`)

            frontend.scopeManager.addDeclaration(declaration)
        }

        frontend.scopeManager.leaveScope(record)

        return record
    }

    private fun handleParameter(ctx: SolidityParser.ParameterContext): ParamVariableDeclaration {
        val name = ctx.identifier()?.text?.trim() ?: ""
        var type: Type = UnknownType.getUnknownType(language)
        ctx.typeName()?.let {
            type = frontend.typeHandler.handle(it) ?: UnknownType.getUnknownType(language)
        }

        val param = newParamVariableDeclaration(name, type, false, frontend.getCodeFromRawNode(ctx))

        return param
    }

    private fun handleContractDefinition(
        ctx: SolidityParser.ContractDefinitionContext
    ): RecordDeclaration {
        val record =
            newRecordDeclaration(
                ctx.identifier().text.trim(),
                "contract",
                frontend.getCodeFromRawNode(ctx)
            )

        frontend.declaredTypes.put(record.name.toString(), record)

        // enter the record scope
        frontend.scopeManager.enterScope(record)

        for (part in ctx.contractPart()) {
            var declaration: Declaration? = null

            part.functionDefinition()?.let { declaration = handle(part.functionDefinition()) }

            part.stateVariableDeclaration()?.let {
                declaration = handle(part.stateVariableDeclaration())
            }

            part.structDefinition()?.let { declaration = handle(part.structDefinition()) }

            part.modifierDefinition()?.let { declaration = handle(part.modifierDefinition()) }

            // add the declaration
            declaration?.let { frontend.scopeManager.addDeclaration(declaration) }
        }

        // leave the record scope
        frontend.scopeManager.leaveScope(record)

        return record
    }

    public fun handleMissingContractDefinition(
        filename: String,
        unit: SolidityParser.SourceUnitContext
    ): RecordDeclaration {
        val record =
            newRecordDeclaration(
                "Contract" + filename.subSequence(0, filename.indexOf(".")),
                "contract",
                frontend.getCodeFromRawNode(unit)
            )

        frontend.declaredTypes.put(record.name.toString(), record)

        // enter the record scope
        frontend.scopeManager.enterScope(record)

        for (part in unit.contractPart()) {
            var declaration: Declaration? = null

            part.functionDefinition()?.let { declaration = handle(it) }

            part.stateVariableDeclaration()?.let { declaration = handle(it) }

            part.structDefinition()?.let { declaration = handle(it) }

            part.modifierDefinition()?.let { declaration = handle(it) }

            // add the declaration
            declaration?.let { frontend.scopeManager.addDeclaration(declaration) }
        }

        if (
            unit.block() != null && unit.block().isNotEmpty() ||
                unit.statement() != null && unit.statement().isNotEmpty() ||
                unit.expressionStatement() != null && unit.expressionStatement().isNotEmpty()
        ) {
            frontend.scopeManager.addDeclaration(handleMissingFunctionDefinition(filename, unit))
        }

        // leave the record scope
        frontend.scopeManager.leaveScope(record)

        return record
    }

    private fun handleModifierDefinition(
        ctx: SolidityParser.ModifierDefinitionContext
    ): ModifierDefinition {
        val desc = ctx.identifier()

        val record = frontend.scopeManager.currentRecord

        val modifier = ModifierDefinition()
        modifier.applyMetadata(this, desc.text?.trim(), ctx, ctx.text?.trim())
        record?.let { modifier.recordDeclaration = record }

        // enter function scope
        frontend.scopeManager.enterScope(modifier)

        // handle body
        modifier.body = frontend.statementHandler.handle(ctx.block())

        ctx.parameterList()?.let {
            for (param in it.parameter()) {
                val decl = frontend.declarationHandler.handle(param)

                frontend.scopeManager.addDeclaration(decl)
            }
        }

        ctx.VirtualKeyword()?.let {
        }

        ctx.overrideSpecifier().let {
        }

        val recordType =
            if (record != null) {
                TypeParser.createFrom(record.name.toString(), false, frontend)
            } else {
                UnknownType.getUnknownType(language)
            }

        // create the this receiver
        val receiver =
            newVariableDeclaration("this", recordType, frontend.getCodeFromRawNode(ctx), false)

        modifier.receiver = receiver

        // leave function scope
        frontend.scopeManager.leaveScope(modifier)

        (frontend as SolidityLanguageFrontend).let { it.modifierMap[modifier] = ctx }

        return modifier
    }

    private fun handleFunctionDefinition(
        ctx: SolidityParser.FunctionDefinitionContext
    ): MethodDeclaration {
        val desc = ctx.functionDescriptor()
        val modifierInvocationIdentifiers = mutableListOf<String>()

        ctx.modifierList()?.modifierInvocation()?.let {
            it.forEach { modifierInvocationIdentifiers.add(it.identifier().text?.trim() ?: "") }
        }

        val record = frontend.scopeManager.currentRecord

        val method =
            if (
                desc.ConstructorKeyword() != null ||
                    record != null &&
                        desc.identifier() != null &&
                        desc.identifier().text?.trim().equals(record.name.toString())
            ) {
                newConstructorDeclaration(
                    record?.name ?: "",
                    frontend.getCodeFromRawNode(ctx),
                    record
                )
            } else {
                newMethodDeclaration(
                    desc.identifier()?.text?.trim() ?: "",
                    frontend.getCodeFromRawNode(ctx),
                    false,
                    record
                )
            }

        // enter function scope
        frontend.scopeManager.enterScope(method)

        ctx.parameterList()?.let {
            for (param in it.parameter()) {
                val decl = frontend.declarationHandler.handle(param)

                frontend.scopeManager.addDeclaration(decl)
            }
        }

        // Should parse more than one return parameter
        ctx.returnParameters()?.parameterList()?.parameter()?.firstOrNull()?.let {
            frontend.typeHandler.handle(it.typeName())?.let { method.type = it }
        }

        ctx.modifierList()?.let {
            it.ExternalKeyword()?.let {

            }
        }

        val recordType =
            if (record != null) {
                TypeParser.createFrom(record.name.toString(), false, frontend)
            } else {
                UnknownType.getUnknownType(language)
            }

        // create the this receiver
        val receiver =
            newVariableDeclaration("this", recordType, frontend.getCodeFromRawNode(ctx), false)

        method.receiver = receiver

        if (modifierInvocationIdentifiers.isEmpty()) {
            // handle body, if the function has modifiers, the handling of the block is done when we
            // for sure know all modifiers
            ctx.block()?.let { method.body = frontend.statementHandler.handle(it) }
        } else {
            (frontend).let {
                it.functionsWithModifiers[ctx] = method
                ctx.returnParameters()?.parameterList()?.let {
                    frontend.functionsWithModifiersAndNamedRet[ctx] = it
                }
            }
        }
        method.body?.let {
            if (ctx.returnParameters() != null) {
                method.body = addReturnVariablesToBlock(it, ctx.returnParameters().parameterList())
            }
        }

        // leave function scope
        frontend.scopeManager.leaveScope(method)

        return method
    }

    private fun addReturnVariablesToBlock(
        block: Statement,
        returnParams: SolidityParser.ParameterListContext
    ): CompoundStatement {
        val rets = mutableListOf<DeclaredReferenceExpression>()
        val retBlock: CompoundStatement

        if (!(block is CompoundStatement)) {
            val cpStmt = newCompoundStatement(block.code)
            cpStmt.location = block.location
            cpStmt.statements = mutableListOf(block)
            retBlock = cpStmt
        } else retBlock = block

        val declStatement = newDeclarationStatement(frontend.getCodeFromRawNode(returnParams))
        declStatement.location = frontend.getLocationFromRawNode(returnParams)

        frontend.scopeManager.enterScope(retBlock)
        returnParams
            .parameter()
            .toList()
            .filter { it.identifier() != null }
            .forEach {
                val type = frontend.typeHandler.handle(it.typeName()) ?: newUnknownType()
                val name = it.identifier().text.trim()

                val varDecl =
                    newVariableDeclaration(name, type, frontend.getCodeFromRawNode(it), false)
                varDecl.location = frontend.getLocationFromRawNode(it)

                frontend.scopeManager.addDeclaration(varDecl)
                declStatement.addToPropertyEdgeDeclaration(varDecl)

                rets.add(
                    newDeclaredReferenceExpression(name, type, frontend.getCodeFromRawNode(it))
                )
            }
        if (rets.size == returnParams.parameter().toList().size) {
            val retStmt =
                newReturnStatement(frontend.getCodeFromRawNode(returnParams), returnParams)
            retStmt.location = frontend.getLocationFromRawNode(returnParams)
            if (rets.size == 1) {
                retStmt.returnValue = rets.get(0)
            } else {
                val retLists = newInitializerListExpression(frontend.getCodeFromRawNode(ctx), ctx)
                retLists.location = frontend.getLocationFromRawNode(ctx)
                retLists.initializers = rets
                retStmt.returnValue = retLists
            }

            val tmp = retBlock.statements.toMutableList()
            tmp.add(0, declStatement)
            tmp.add(retStmt)
            retBlock.statements = tmp
        }

        frontend.scopeManager.leaveScope(retBlock)
        return retBlock
    }

    private fun handleMissingFunctionDefinition(
        filename: String,
        unit: SolidityParser.SourceUnitContext
    ): MethodDeclaration {

        val record = frontend.scopeManager.currentRecord

        val method =
            newMethodDeclaration(
                "function_" + filename,
                frontend.getCodeFromRawNode(unit),
                false,
                record
            )

        // enter function scope
        frontend.scopeManager.enterScope(method)

        method.type = UnknownType.getUnknownType(language)

        val recordType =
            if (record != null) {
                TypeParser.createFrom(record.name.toString(), false, frontend)
            } else {
                UnknownType.getUnknownType(language)
            }

        // create the this receiver
        val receiver =
            newVariableDeclaration("this", recordType, frontend.getCodeFromRawNode(unit), false)

        method.receiver = receiver

        if (unit.block() != null && unit.block().isNotEmpty()) {
            method.body = frontend.statementHandler.handle(unit.block()[0])
        } else if (
            unit.statement() != null && unit.statement().isNotEmpty() ||
                unit.expressionStatement() != null && unit.expressionStatement().isNotEmpty()
        ) {
            method.body = frontend.statementHandler.handleMissingBlock(unit)
        }

        // leave function scope
        frontend.scopeManager.leaveScope(method)

        return method
    }

    public fun handleModifierExpansion(
        ctx: SolidityParser.FunctionDefinitionContext,
        method: MethodDeclaration
    ) {
        frontend.modifierStack.clear()
        frontend.currentIdentifierMapStack.clear()
        frontend.modifierStack.push(ctx)

        ctx.modifierList()?.modifierInvocation()?.let {
            it.asReversed().forEach {
                val name = it.identifier().text?.trim() ?: ""
                val modifierInvocation = it
                frontend.modifierMap.values
                    .filter { it.identifier().text?.trim() == name }
                    .filter { it.block() != null }
                    .firstOrNull()
                    ?.let {
                        frontend.modifierStack.push(it)

                        val modifier =
                            frontend.modifierStack.peek()
                                as SolidityParser.ModifierDefinitionContext
                        frontend.modifierIdentifierMap.put(modifier, mutableMapOf())
                        modifierInvocation.expressionList()?.let {
                            val expressions =
                                it.children.filterIsInstance<SolidityParser.ExpressionContext>()
                            val parameters =
                                modifier
                                    .parameterList()
                                    .children
                                    .filterIsInstance<SolidityParser.ParameterContext>()
                            for (i in 0 until expressions.size) {
                                frontend.modifierIdentifierMap[modifier]!![
                                    parameters[i].identifier().text.trim()] = expressions[i]
                            }
                        }
                    }
            }
        }

        frontend.scopeManager.enterScope(method)
        ctx.block()?.let { method.body = frontend.statementHandler.handle(it) }
        val modifier = frontend.modifierStack.pop()
        frontend.currentIdentifierMapStack.push(frontend.modifierIdentifierMap[modifier])
        method.body = expandBodyWithModifiers(modifier)
        // To consider named returns
        method.body?.let {
            val body = it
            frontend.functionsWithModifiersAndNamedRet[ctx]?.let {
                method.body = addReturnVariablesToBlock(body, it)
            }
        }
        SubgraphWalker.flattenAST(method.body).forEach { it.comment = it.comment ?: "" + methodId }
        methodId++

        frontend.modifierStack.push(modifier)
        frontend.currentIdentifierMapStack.pop()
        frontend.scopeManager.leaveScope(method)
    }

    public fun expandBodyWithModifiers(modifierOrFunction: ParserRuleContext): Statement {
        if (modifierOrFunction is SolidityParser.FunctionDefinitionContext) {
            return frontend.statementHandler.handle(modifierOrFunction.block())!!
        } else if (modifierOrFunction is SolidityParser.ModifierDefinitionContext) {
            // should handle parameters and handle modifier body
            val block = frontend.statementHandler.handle(modifierOrFunction.block())
            (block as CompoundStatement).let {
                // Indexed Prepend of statement
            }
            return block
        } else {
            log.error("Non modifier or function was provided during modifier expansion")
        }
        return newProblemExpression(
            "Body expansion failed",
            ProblemNode.ProblemType.TRANSLATION,
        )
    }

    private fun handleStateVariableDeclaration(
        ctx: SolidityParser.StateVariableDeclarationContext
    ): Declaration {
        val name = ctx.identifier().Identifier()?.text?.trim() ?: ctx.identifier().text?.trim()
        var type: Type = UnknownType.getUnknownType(language)
        ctx.typeName()?.let {
            type = frontend.typeHandler.handle(it) ?: UnknownType.getUnknownType(language)
        }

        var initializer: Expression? = null
        ctx.expression()?.let { initializer = frontend.expressionHandler.handle(it) }

        val field =
            newFieldDeclaration(
                name,
                type,
                listOf(),
                frontend.getCodeFromRawNode(ctx),
                frontend.getLocationFromRawNode(ctx),
                initializer,
                false
            )

        return field
    }

    private fun handleVariableDeclaration(
        ctx: SolidityParser.VariableDeclarationContext
    ): FieldDeclaration {
        val name = ctx.identifier()?.Identifier()?.text?.trim() ?: ""
        var type: Type = UnknownType.getUnknownType(language)
        ctx.typeName()?.let {
            type = frontend.typeHandler.handle(it) ?: UnknownType.getUnknownType(language)
        }

        val field =
            newFieldDeclaration(
                name,
                type,
                listOf(),
                frontend.getCodeFromRawNode(ctx),
                frontend.getLocationFromRawNode(ctx),
                null,
                false
            )

        return field
    }
}
