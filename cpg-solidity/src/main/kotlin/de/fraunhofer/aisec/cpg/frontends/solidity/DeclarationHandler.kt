package de.fraunhofer.aisec.cpg.frontends.solidity

import SolidityParser
import de.fraunhofer.aisec.cpg.frontends.Handler
import de.fraunhofer.aisec.cpg.graph.NodeBuilder
import de.fraunhofer.aisec.cpg.graph.declarations.*
import de.fraunhofer.aisec.cpg.graph.statements.expressions.Expression
import de.fraunhofer.aisec.cpg.graph.types.TypeParser
import de.fraunhofer.aisec.cpg.graph.types.UnknownType
import de.fraunhofer.aisec.cpg.helpers.Util
import org.antlr.v4.runtime.ParserRuleContext
import org.slf4j.LoggerFactory

class DeclarationHandler(lang: SolidityLanguageFrontend) : Handler<Declaration, ParserRuleContext, SolidityLanguageFrontend>(::Declaration, lang) {

    private val logger = LoggerFactory.getLogger(DeclarationHandler::class.java)

    init {
        map.put(SolidityParser.ContractDefinitionContext::class.java) { handleContractDefinition(it as SolidityParser.ContractDefinitionContext) }
        map.put(SolidityParser.FunctionDefinitionContext::class.java) { handleFunctionDefinition(it as SolidityParser.FunctionDefinitionContext) }
        map.put(SolidityParser.ParameterContext::class.java) { handleParameter(it as SolidityParser.ParameterContext) }
        map.put(SolidityParser.StateVariableDeclarationContext::class.java) { handleStateVariableDeclaration(it as SolidityParser.StateVariableDeclarationContext) }
        map.put(SolidityParser.VariableDeclarationContext::class.java) { handleVariableDeclaration(it as SolidityParser.VariableDeclarationContext) }
        map.put(SolidityParser.StructDefinitionContext::class.java) { handleStructDefinition(it as SolidityParser.StructDefinitionContext) }
    }

    private fun handleStructDefinition(ctx: SolidityParser.StructDefinitionContext): Declaration {
        val name = ctx.identifier().text

        val record = NodeBuilder.newRecordDeclaration(name, "struct", this.lang.getCodeFromRawNode(ctx))

        this.lang.scopeManager.enterScope(record)

        for(`var` in ctx.variableDeclaration() ?: listOf()) {
            val declaration = handle(`var`)

            this.lang.scopeManager.addDeclaration(declaration)
        }

        this.lang.scopeManager.leaveScope(record)

        return record
    }

    private fun handleParameter(ctx: SolidityParser.ParameterContext): ParamVariableDeclaration {
        val name = ctx.identifier()?.text ?: ""
        val type = this.lang.typeHandler.handle(ctx.typeName())

        val param = NodeBuilder.newMethodParameterIn(name,
            type,
            false,
            this.lang.getCodeFromRawNode(ctx)
        )

        return param
    }

    private fun handleContractDefinition(ctx: SolidityParser.ContractDefinitionContext): RecordDeclaration {
        val record = NodeBuilder.newRecordDeclaration(
            ctx.identifier().text,
            "contract",
            lang.getCodeFromRawNode(ctx))

        // enter the record scope
        this.lang.scopeManager.enterScope(record)

        for(part in ctx.contractPart()) {
            var declaration: Declaration? = null

            part.functionDefinition()?.let {
                declaration = handle(part.functionDefinition())
            }

            part.stateVariableDeclaration()?.let {
                declaration = handle(part.stateVariableDeclaration())
            }

            part.structDefinition()?.let {
                declaration = handle(part.structDefinition())
            }

            // add the declaration
            declaration?.let { this.lang.scopeManager.addDeclaration(declaration) }
        }

        // leave the record scope
        this.lang.scopeManager.leaveScope(record)

        return record
    }

    private fun handleFunctionDefinition(ctx: SolidityParser.FunctionDefinitionContext): MethodDeclaration {
        val desc = ctx.functionDescriptor()

        val record = this.lang.scopeManager.currentRecord

        val method = if(desc.ConstructorKeyword() != null) {
            NodeBuilder.newConstructorDeclaration(
                record?.name ?: "",
                this.lang.getCodeFromRawNode(ctx),
                record
            )
        } else {
            NodeBuilder.newMethodDeclaration(
                desc.identifier()?.text ?: "",
                this.lang.getCodeFromRawNode(ctx),
                false,
                record
            )
        }

        // enter function scope
        this.lang.scopeManager.enterScope(method)

        // handle body
        method.body = this.lang.statementHandler.handle(ctx.block())

        ctx.parameterList()?.let {
            for(param in it.parameter()) {
                val decl = this.lang.declarationHandler.handle(param)

                this.lang.scopeManager.addDeclaration(decl)
            }
        }

        // TODO: parse more than one return parameter
        ctx.returnParameters()?.parameterList()?.parameter()?.firstOrNull()?.let {
            method.type = this.lang.typeHandler.handle(it.typeName())
        }

        val recordType = if(record != null) {
            TypeParser.createFrom(record.name, false)
        } else {
            UnknownType.getUnknownType()
        }

        // create the this receiver
        val receiver = NodeBuilder.newVariableDeclaration(
            "this",
            recordType,
            this.lang.getCodeFromRawNode(ctx), false)

        method.receiver = receiver

        // leave function scope
        this.lang.scopeManager.leaveScope(method)

        return method
    }

    private fun handleStateVariableDeclaration(ctx: SolidityParser.StateVariableDeclarationContext): Declaration {
        val name = ctx.identifier().Identifier().text
        val type = this.lang.typeHandler.handle(ctx.typeName())

        var initializer: Expression? = null
        ctx.expression()?.let {
            initializer = this.lang.expressionHandler.handle(it)
        }

        val field = NodeBuilder.newFieldDeclaration(name,
            type,
            listOf(),
            this.lang.getCodeFromRawNode(ctx),
            this.lang.getLocationFromRawNode(ctx),
            initializer,
            false)

        return field
    }

    private fun handleVariableDeclaration(ctx: SolidityParser.VariableDeclarationContext): FieldDeclaration {
        val name = ctx.identifier()?.Identifier()?.text ?: ""
        val type = this.lang.typeHandler.handle(ctx.typeName())

        val field = NodeBuilder.newFieldDeclaration(name,
            type,
            listOf(),
            this.lang.getCodeFromRawNode(ctx),
            this.lang.getLocationFromRawNode(ctx),
            null,
            false)

        return field
    }
}