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

import de.fraunhofer.aisec.cpg.TranslationContext
import de.fraunhofer.aisec.cpg.TranslationResult
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.Return
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.Rollback
import de.fraunhofer.aisec.cpg.graph.Node
import de.fraunhofer.aisec.cpg.graph.declarations.FunctionDeclaration
import de.fraunhofer.aisec.cpg.graph.edge.Properties
import de.fraunhofer.aisec.cpg.graph.edge.PropertyEdge
import de.fraunhofer.aisec.cpg.graph.statements.expressions.ArraySubscriptionExpression
import de.fraunhofer.aisec.cpg.graph.statements.expressions.CallExpression
import de.fraunhofer.aisec.cpg.graph.types.ObjectType
import de.fraunhofer.aisec.cpg.graph.types.UnknownType
import de.fraunhofer.aisec.cpg.helpers.SubgraphWalker
import de.fraunhofer.aisec.cpg.passes.TranslationResultPass

class GraphExtensionsPass(ctx: TranslationContext) : TranslationResultPass(ctx) {

    private var returnsNodes: MutableMap<FunctionDeclaration, Return> = mutableMapOf()

    override fun accept(result: TranslationResult) {
        result?.let {
            val allNodes = SubgraphWalker.flattenAST(it)
            var functions = allNodes.filterIsInstance<FunctionDeclaration>()
            addSubscriptionType(allNodes)
            addAdditionalEOGEdges(functions)
            addAdditionalDFGEdges(functions)
            addReturnNodes(allNodes)
            result.components
            result.components
                .map { it.language?.frontend }
                .filterIsInstance<SolidityLanguageFrontend>()
                .forEach { it.pragmas.forEach { result += it } }
        }
    }

    override fun cleanup() {}

    private fun addSubscriptionType(allNodes: List<Node>) {
        var subscriptions = allNodes.filterIsInstance<ArraySubscriptionExpression>().toMutableList()
        while (subscriptions.isNotEmpty()) {
            // Because a subscription expression can have another unresolved subscription expression
            // as its arrayExpression
            val toProcess = subscriptions.filter { !(it.arrayExpression.type is UnknownType) }
            if (toProcess.isEmpty()) break // No more processeable expressions
            toProcess.forEach {
                // If the type of the subscript expression is a mapping access we have to set the
                // type here as it is a custom type
                val sType = it.arrayExpression.type
                if (
                    sType is ObjectType &&
                        sType.name.toString() == "mapping" &&
                        sType.generics.size >= 2
                ) {
                    it.type = sType.generics[1]
                }
                subscriptions.remove(it)
            }
        }
    }

    private fun addAdditionalEOGEdges(functions: List<FunctionDeclaration>) {
        functions.forEach {
            val function = it
            var body = it.body
            body?.let {
                SubgraphWalker.flattenAST(function)
                    .filter { it.prevEOG.isNotEmpty() }
                    .filter { it.nextEOG.isEmpty() }
                    .filterNot { it is Rollback }
                    .filterNot { it == body }
                    .forEach {
                        val propertyEdge: PropertyEdge<Node> = PropertyEdge<Node>(it, body)
                        propertyEdge.addProperty(Properties.INDEX, 0)
                        it.addNextEOG(propertyEdge)
                        body.addPrevEOG(propertyEdge)
                    }
            }
        }
    }

    private fun addAdditionalDFGEdges(functions: List<FunctionDeclaration>) {
        functions.forEach {
            val function = it
            var body = it.body
            body?.let {
                SubgraphWalker.flattenAST(function)
                    .filter { it.prevEOG.isNotEmpty() }
                    .filter { it.nextEOG.isEmpty() }
                    .filterNot { it is Rollback }
                    .filterNot { it == body }
                    .forEach {
                        val propertyEdge: PropertyEdge<Node> = PropertyEdge<Node>(it, body)
                        propertyEdge.addProperty(Properties.INDEX, 0)
                        it.addNextEOG(propertyEdge)
                        body.addPrevEOG(propertyEdge)
                    }
            }
        }
    }

    private fun addReturnNodes(allNodes: List<Node>) {

        var calls = allNodes.filterIsInstance<CallExpression>()
        calls.forEach {
            val call = it
            call.invokes.forEach {
                val function = it
                it.body?.let {
                    if (!returnsNodes.contains(function)) {
                        returnsNodes[function] = Return()
                        val propertyEdge: PropertyEdge<Node> =
                            PropertyEdge<Node>(it, returnsNodes[function]!!)
                        propertyEdge.addProperty(Properties.INDEX, 0)
                        it.addNextEOG(propertyEdge)
                        returnsNodes[function]!!.addPrevEOG(propertyEdge)
                    }
                    returnsNodes[function]!!.returns.add(call)
                }
            }
        }
    }
}
