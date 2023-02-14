package de.fraunhofer.aisec.cpg.frontends.solidity

import de.fraunhofer.aisec.cpg.TranslationResult
import de.fraunhofer.aisec.cpg.graph.HasBase
import de.fraunhofer.aisec.cpg.graph.Node
import de.fraunhofer.aisec.cpg.graph.statements.expressions.*
import de.fraunhofer.aisec.cpg.helpers.SubgraphWalker
import de.fraunhofer.aisec.cpg.passes.Pass

class DFGExtensionPass: Pass() {

    val binOp = setOf("=", "|=", "^=", "&=", "<<=",">>=","+=", "-=", "*=", "/=", "%=")
    val unaOp = setOf("++", "--")
    // some member accesses don't transmit direct data
    val memberAccessWithoutData = setOf("length")

    override fun accept(p0: TranslationResult?) {
        var nodes = SubgraphWalker.flattenAST(p0)
        val nodesBinary = nodes.filter { it is BinaryOperator && it.operatorCode in binOp || it is UnaryOperator && it.operatorCode in unaOp}
        nodesBinary.map { getSourceTargetExpression(it) }.forEach {
            if(it.second.javaClass != DeclaredReferenceExpression::class.java){
                var coarseGrainedTarget = getCoarseGrainedTarget(it.second)
                if(coarseGrainedTarget is DeclaredReferenceExpression){
                    coarseGrainedTarget.addPrevDFG(it.first)
                    coarseGrainedTarget.refersTo?.let { coarseGrainedTarget.addNextDFG(it) }
                }

            }
        }

        // While no direct data is flowing from the array subscript to the expression, selection information constitutes an indirect data-flow
        nodes.filterIsInstance<ArraySubscriptionExpression>().map { it.addPrevDFG(it.subscriptExpression) }

        /*
            Generalizing any dataflow from an unknown field of a class to data flows of the reference. We have to exclude certain member
            names from this generalization as it leads to many false positives in the case of msg.data.length. However, we can
            exclude 'length' specifically as it transpots far less information.
         */
        nodes.filterIsInstance<MemberExpression>().map {
            if(it.refersTo == null && !memberAccessWithoutData.contains(it.name)){
                it.addPrevDFG(it.base)
            }
        }

        nodes.filterIsInstance<CallExpression>().filter { it.name.equals("push") }.forEach {
            val call = it
            it.base?.let {
                val base = it
                call.arguments.forEach { base.addPrevDFG(it) }
            }
        }


    }

    fun getCoarseGrainedTarget(n: Node): Node {
        if(n is HasBase && n.base != null){
            return getCoarseGrainedTarget(n.base)
        }else if(n is Literal<*>){
            return n
        }else if(n is BinaryOperator){
            return getCoarseGrainedTarget(n.lhs)
        }else if(n is UnaryOperator){
            return getCoarseGrainedTarget(n.input)
        }else if(n is DeclaredReferenceExpression){
            return n
        }else if(n is ArraySubscriptionExpression){
            return getCoarseGrainedTarget(n.arrayExpression)
        }else if(n is CastExpression){
            return getCoarseGrainedTarget(n.expression)
        }
        return n
    }

    fun getSourceTargetExpression(n: Node): Pair<Node, Node>{
        if(n is BinaryOperator){
            return Pair(n.rhs, n.lhs)
        }else if(n is UnaryOperator){
            return Pair(n.input, n.input)
        }
        return Pair(n, n)
    }

    override fun cleanup() {
    }
}