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

    override fun accept(p0: TranslationResult?) {
        var nodes = SubgraphWalker.flattenAST(p0)
        nodes = nodes.filter { it is BinaryOperator && it.operatorCode in binOp || it is UnaryOperator && it.operatorCode in unaOp}
        nodes.map { getSourceTargetExpression(it) }.forEach {
            if(it.second.javaClass != DeclaredReferenceExpression::class.java){
                // Todo find the expression that is that target
                var coarseGrainedTarget = getCoarseGrainedTarget(it.second)
                if(coarseGrainedTarget is DeclaredReferenceExpression){
                    coarseGrainedTarget.addPrevDFG(it.first)
                    coarseGrainedTarget.refersTo?.let { coarseGrainedTarget.addNextDFG(it) }
                }

            }
        }
    }

    fun getCoarseGrainedTarget(n: Node): Node {
        if(n is HasBase){
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