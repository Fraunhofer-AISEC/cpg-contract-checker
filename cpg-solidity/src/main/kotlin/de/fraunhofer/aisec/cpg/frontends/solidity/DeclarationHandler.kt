package de.fraunhofer.aisec.cpg.frontends.solidity

import SolidityParser
import de.fraunhofer.aisec.cpg.frontends.Handler
import de.fraunhofer.aisec.cpg.graph.NodeBuilder
import de.fraunhofer.aisec.cpg.graph.declarations.Declaration
import org.antlr.v4.runtime.ParserRuleContext

class DeclarationHandler(lang: SolidityLanguageFrontend) : Handler<Declaration, ParserRuleContext, SolidityLanguageFrontend>(::Declaration, lang) {
    init {
        map.put(SolidityParser.ContractDefinitionContext::class.java) { handleContractDefinition(it as SolidityParser.ContractDefinitionContext) }
    }

    private fun handleContractDefinition(ctx: SolidityParser.ContractDefinitionContext): Declaration {
        val record = NodeBuilder.newRecordDeclaration(ctx.identifier().text, "contract", lang.getCodeFromRawNode(ctx))

        // enter the record scope
        this.lang.scopeManager.enterScope(record)

        // TODO: parse the members

        // leave the record scope
        this.lang.scopeManager.leaveScope(record)

        return record
    }
}