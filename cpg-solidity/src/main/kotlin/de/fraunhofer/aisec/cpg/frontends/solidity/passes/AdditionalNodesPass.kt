package de.fraunhofer.aisec.cpg.frontends.solidity.passes

import de.fraunhofer.aisec.cpg.TranslationResult
import de.fraunhofer.aisec.cpg.frontends.solidity.SolidityLanguageFrontend
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.*
import de.fraunhofer.aisec.cpg.frontends.solidity.plusAssign
import de.fraunhofer.aisec.cpg.graph.statements.expressions.CallExpression
import de.fraunhofer.aisec.cpg.passes.Pass

class AdditionalNodesPass: Pass() {

    private var tr: TranslationResult? = null


    override fun accept(result: TranslationResult) {
        (lang as SolidityLanguageFrontend).additionalNodes.forEach {
            result += it
        }

    }

    override fun cleanup() {
    }
}