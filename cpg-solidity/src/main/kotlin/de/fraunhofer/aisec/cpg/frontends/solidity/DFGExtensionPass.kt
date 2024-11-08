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
import de.fraunhofer.aisec.cpg.graph.HasBase
import de.fraunhofer.aisec.cpg.graph.Node
import de.fraunhofer.aisec.cpg.graph.declarations.TranslationUnitDeclaration
import de.fraunhofer.aisec.cpg.graph.statements.expressions.*
import de.fraunhofer.aisec.cpg.helpers.SubgraphWalker
import de.fraunhofer.aisec.cpg.passes.ControlFlowSensitiveDFGPass
import de.fraunhofer.aisec.cpg.passes.TranslationUnitPass
import de.fraunhofer.aisec.cpg.passes.order.DependsOn

@DependsOn(ControlFlowSensitiveDFGPass::class)
class DFGExtensionPass(ctx: TranslationContext) : TranslationUnitPass(ctx) {

    val binOp = setOf("=", "|=", "^=", "&=", "<<=", ">>=", "+=", "-=", "*=", "/=", "%=")
    val unaOp = setOf("++", "--")
    // some member accesses don't transmit direct data
    val memberAccessWithoutData = setOf("length")

    override fun accept(p0: TranslationUnitDeclaration) {
        var nodes = SubgraphWalker.flattenAST(p0)
        val nodesBinary =
            nodes.filter {
                it is BinaryOperator && it.operatorCode in binOp ||
                    it is UnaryOperator && it.operatorCode in unaOp
            }
        nodesBinary
            .map { getSourceTargetExpression(it) }
            .forEach {
                if (it.second.javaClass != DeclaredReferenceExpression::class.java) {
                    var coarseGrainedTarget = getCoarseGrainedTarget(it.second)
                    if (coarseGrainedTarget is DeclaredReferenceExpression) {
                        coarseGrainedTarget.addPrevDFG(it.first)
                        coarseGrainedTarget.refersTo?.let { coarseGrainedTarget.addNextDFG(it) }
                    }
                }
            }

        // While no direct data is flowing from the array subscript to the expression, selection
        // information constitutes an indirect data-flow
        nodes.filterIsInstance<ArraySubscriptionExpression>().map {
            it.addPrevDFG(it.subscriptExpression)
        }

        /*
           Generalizing any dataflow from an unknown field of a class to data flows of the reference. We have to exclude certain member
           names from this generalization as it leads to many false positives in the case of msg.data.length. However, we can
           exclude 'length' specifically as it transpots far less information.
        */
        nodes.filterIsInstance<MemberExpression>().map {
            if (!memberAccessWithoutData.contains(it.name.localName)) {
                it.addPrevDFG(it.base)
            }
        }

        nodes
            .filterIsInstance<CallExpression>()
            .filter { it.name.localName.equals("push") }
            .forEach {
                val call = it
                val base = getCoarseGrainedTarget(call) as? DeclaredReferenceExpression
                base?.let { call.arguments.forEach { base.refersTo?.addPrevDFG(it) } }
            }

        nodes
            .filterIsInstance<CallExpression>()
            .filter {
                it.name.localName.equals("sha3") ||
                    it.name.localName.equals("keccak256") ||
                    it.name.localName.equals("blockhash") ||
                    it.invokes.any { it.isInferred }
            }
            .forEach {
                val call = it
                call.arguments.forEach { call.addPrevDFG(it) }
            }

        nodes
            .filterIsInstance<CallExpression>()
            .filter { it.invokes.isNotEmpty() || it.invokes.all { it.isInferred } }
            .forEach {
                val call = it
                call.callee?.let { call.addPrevDFG(it) }
                call.callee?.let { call.arguments.forEach { call.addPrevDFG(it) } }
            }

        nodes.filterIsInstance<ConstructExpression>().forEach {
            val construction = it
            construction.arguments.forEach { construction.addPrevDFG(it) }
        }
    }

    fun getCoarseGrainedTarget(n: Node): Node {
        if (n is HasBase && n.base != null) {
            return getCoarseGrainedTarget(n.base!!)
        } else if (n is CallExpression && n.callee != null) {
            return getCoarseGrainedTarget(n.callee!!)
        } else if (n is Literal<*>) {
            return n
        } else if (n is BinaryOperator) {
            return getCoarseGrainedTarget(n.lhs)
        } else if (n is UnaryOperator) {
            return getCoarseGrainedTarget(n.input)
        } else if (n is DeclaredReferenceExpression) {
            return n
        } else if (n is ArraySubscriptionExpression) {
            return getCoarseGrainedTarget(n.arrayExpression)
        } else if (n is CastExpression) {
            return getCoarseGrainedTarget(n.expression)
        }
        return n
    }

    fun getSourceTargetExpression(n: Node): Pair<Node, Node> {
        if (n is BinaryOperator) {
            return Pair(n.rhs, n.lhs)
        } else if (n is UnaryOperator) {
            return Pair(n.input, n.input)
        }
        return Pair(n, n)
    }

    override fun cleanup() {}
}
