package de.fraunhofer.aisec.cpg.frontends.solidity

import SolidityParser
import de.fraunhofer.aisec.cpg.frontends.Handler
import de.fraunhofer.aisec.cpg.graph.NodeBuilder
import de.fraunhofer.aisec.cpg.graph.declarations.Declaration
import de.fraunhofer.aisec.cpg.graph.declarations.MethodDeclaration
import de.fraunhofer.aisec.cpg.graph.types.TypeParser
import org.antlr.v4.runtime.ParserRuleContext

class DeclarationHandler(lang: SolidityLanguageFrontend) : Handler<Declaration, ParserRuleContext, SolidityLanguageFrontend>(::Declaration, lang) {
    init {
        map.put(SolidityParser.ContractDefinitionContext::class.java) { handleContractDefinition(it as SolidityParser.ContractDefinitionContext) }
        map.put(SolidityParser.FunctionDefinitionContext::class.java) { handleFunctionDefinition(it as SolidityParser.FunctionDefinitionContext) }
        map.put(SolidityParser.StateVariableDeclarationContext::class.java) { handleStateVariableDeclaration(it as SolidityParser.StateVariableDeclarationContext) }
    }

    private fun handleContractDefinition(ctx: SolidityParser.ContractDefinitionContext): Declaration {
        val record = NodeBuilder.newRecordDeclaration(
            ctx.identifier().text,
            "contract",
            lang.getCodeFromRawNode(ctx))

        // enter the record scope
        this.lang.scopeManager.enterScope(record)

        var declaration: Declaration? = null
        for(part in ctx.contractPart()) {
            part.functionDefinition()?.let {
                declaration = handle(part.functionDefinition())
            }

            part.stateVariableDeclaration()?.let {
                declaration = handle(part.stateVariableDeclaration())
            }

            // add the declaration
            declaration?.let { this.lang.scopeManager.addDeclaration(declaration) }
        }

        // leave the record scope
        this.lang.scopeManager.leaveScope(record)

        return record
    }

    private fun handleStateVariableDeclaration(ctx: SolidityParser.StateVariableDeclarationContext): Declaration? {
        val field = NodeBuilder.newFieldDeclaration(
            ctx.identifier().text,
            TypeParser.createFrom(ctx.typeName().text, false, this.lang),
            listOf(),
            this.lang.getCodeFromRawNode(ctx),
            this.lang.getLocationFromRawNode(ctx),
            null,
            false
        )

        return field
    }

    private fun handleFunctionDefinition(ctx: SolidityParser.FunctionDefinitionContext): MethodDeclaration {
        val desc = ctx.functionDescriptor()

        val record = this.lang.scopeManager.currentRecord

        val method = NodeBuilder.newMethodDeclaration(
            desc.identifier().text,
            lang.getCodeFromRawNode(ctx),
            false,
            record)

        // enter function scope
        this.lang.scopeManager.enterScope(method)

        // TODO: implement method body

        // leave function scope
        this.lang.scopeManager.leaveScope(method)

        return method
    }
}