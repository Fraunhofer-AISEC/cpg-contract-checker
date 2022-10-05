package de.fraunhofer.aisec.cpg.frontends.solidity

import de.fraunhofer.aisec.cpg.TranslationResult
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.Return
import de.fraunhofer.aisec.cpg.graph.Node
import de.fraunhofer.aisec.cpg.graph.declarations.FunctionDeclaration
import de.fraunhofer.aisec.cpg.graph.edge.Properties
import de.fraunhofer.aisec.cpg.graph.edge.PropertyEdge
import de.fraunhofer.aisec.cpg.graph.statements.ReturnStatement
import de.fraunhofer.aisec.cpg.graph.statements.expressions.CallExpression
import de.fraunhofer.aisec.cpg.helpers.SubgraphWalker
import de.fraunhofer.aisec.cpg.passes.Pass

class GraphExtensionsPass: Pass() {

    override fun accept(result: TranslationResult?) {
        result?.let {
            addAdditionalEOGEdges(it)
            addReturnNodes(it)
        }
    }

    private fun addAdditionalEOGEdges(result: TranslationResult) {
        var funcitons = SubgraphWalker.flattenAST(result).filterIsInstance<FunctionDeclaration>()
        funcitons.forEach {
            var body = it.body
            it.prevDFG.filterIsInstance<ReturnStatement>().forEach {
                val propertyEdge: PropertyEdge<Node> = PropertyEdge<Node>(it, body)
                propertyEdge.addProperty(Properties.INDEX, 0)
                it.addNextEOG(propertyEdge)
                body.addPrevEOG(propertyEdge)



            }

        }
    }

    private fun addReturnNodes(result: TranslationResult){

        var calls = SubgraphWalker.flattenAST(result).filterIsInstance<CallExpression>()
        calls.forEach {
            val call = it
            call.invokes.forEach {
                val function = it
                it.body?.let{
                    val returnNode = Return()
                    returnNode.returns = call
                    val propertyEdge: PropertyEdge<Node> = PropertyEdge<Node>(it, returnNode)
                    propertyEdge.addProperty(Properties.INDEX, 0)
                    it.addNextEOG(propertyEdge)
                    returnNode.addPrevEOG(propertyEdge)
                }
            }
        }
    }

    override fun cleanup() {
    }
}