package de.fraunhofer.aisec.cpg.frontends.solidity

import de.fraunhofer.aisec.cpg.TranslationContext
import de.fraunhofer.aisec.cpg.TranslationResult
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.*
import de.fraunhofer.aisec.cpg.graph.Node
import de.fraunhofer.aisec.cpg.graph.declarations.FunctionDeclaration
import de.fraunhofer.aisec.cpg.graph.declarations.NamespaceDeclaration
import de.fraunhofer.aisec.cpg.graph.declarations.RecordDeclaration
import de.fraunhofer.aisec.cpg.graph.declarations.TranslationUnitDeclaration
import de.fraunhofer.aisec.cpg.graph.edge.PropertyEdge
import de.fraunhofer.aisec.cpg.graph.statements.ReturnStatement
import de.fraunhofer.aisec.cpg.graph.statements.Statement
import de.fraunhofer.aisec.cpg.graph.statements.expressions.CallExpression
import de.fraunhofer.aisec.cpg.graph.statements.expressions.MemberCallExpression
import de.fraunhofer.aisec.cpg.helpers.SubgraphWalker
import de.fraunhofer.aisec.cpg.passes.EvaluationOrderGraphPass
import java.util.function.Consumer
import java.util.stream.Collectors

class EOGExtensionPass(ctx: TranslationContext): EvaluationOrderGraphPass(ctx) {

    private var tr: TranslationResult? = null

    init {
        map[UncheckedStatement::class.java] = {handleUncheckedStatement(it as UncheckedStatement)}
        map[EmitStatement::class.java] = {handleEmitStatement(it as EmitStatement)}
        map[Revert::class.java] = {handleRevert(it as Revert)}
        map[Require::class.java] = {handleRequire(it as Require)}
        map[SpecifiedExpression::class.java] = {handleSpecifiedExpression(it as SpecifiedExpression)}
        map[CallExpression::class.java] = {handleCallExpression(it as CallExpression)}
    }

    override fun accept(tu: TranslationUnitDeclaration) {
        createEOG(tu)
    }

    fun overriddenRemoveUnreachableEOGEdges(tu: TranslationUnitDeclaration) {
        val eognodes = SubgraphWalker.flattenAST(tu).stream()
            .filter { node: Node -> !(node.prevEOG.isEmpty() && node.nextEOG.isEmpty()) }
            .collect(Collectors.toList())
        tr?.let { eognodes.addAll(it.additionalNodes) }
        var validStarts = eognodes.stream()
            .filter { node: Node? ->
                (node is FunctionDeclaration
                        || node is RecordDeclaration
                        || node is NamespaceDeclaration
                        || node is TranslationUnitDeclaration)
            }
            .collect(Collectors.toList())
        while (!validStarts.isEmpty()) {
            eognodes.removeAll(validStarts)
            validStarts = validStarts.stream()
                .flatMap { node: Node -> node.nextEOG.stream() }
                .collect(Collectors.toList())
            validStarts = validStarts.stream()
                .filter { o: Node? -> eognodes.contains(o)}
                .collect(Collectors.toList())
        }
        // remaining eognodes were not visited and have to be removed from the EOG
        for (unvisitedNode in eognodes) {
            unvisitedNode
                .nextEOGEdges
                .forEach(Consumer { next: PropertyEdge<Node> ->
                    next.end.removePrevEOGEntry(
                        unvisitedNode
                    )
                })
            unvisitedNode.nextEOGEdges.clear()
        }
    }

    private fun handleUncheckedStatement(node: Node) {
        val uncheckedStatement: UncheckedStatement = node as UncheckedStatement

        createEOG(uncheckedStatement.uncheckedBlock)
        pushToEOG(node)
    }

    private fun handleEmitStatement(node: Node) {
        val emitStatement: EmitStatement = node as EmitStatement

        createEOG(emitStatement.emits)
        pushToEOG(node)
    }

    private fun handleSpecifiedExpression(node: Node) {
        val specifiedExpression: SpecifiedExpression = node as SpecifiedExpression

        createEOG(specifiedExpression.expression)
        createEOG(specifiedExpression.specifiers)
        pushToEOG(node)
    }

    private fun handleRevert(node: Node) {
        val revert: Revert = node as Revert

        createEOG(revert.message)
        pushToEOG(node)

        val solidityLanguageFrontend = node.language!!.frontend as SolidityLanguageFrontend

        solidityLanguageFrontend?.scopeManager?.currentFunction?.let {

            val rollback = solidityLanguageFrontend.rollbackNodes.getOrPut(it) {Rollback()}
            pushToEOG(rollback)
            tr?.let { it += rollback }
        }

        currentPredecessors.clear()


    }

    private fun handleRequire(node: Node) {
        val require: Require = node as Require

        require.message?.let {  createEOG(it) }
        createEOG(require.condition)
        pushToEOG(require)


        val openBranchNodes: List<Node> = ArrayList()
        val openConditionEOGs: List<Node> = ArrayList(currentPredecessors)
        //currentProperties[Properties.BRANCH] = false

        val solidityLanguageFrontend = node.language!!.frontend as SolidityLanguageFrontend
        solidityLanguageFrontend?.scopeManager?.currentFunction?.let {

            val rollback = solidityLanguageFrontend.rollbackNodes.getOrPut(it) {Rollback()}
            pushToEOG(rollback)
            tr?.let { it += rollback }
        }

        currentPredecessors.clear()

        setCurrentEOGs(openConditionEOGs)
        // currentProperties[Properties.BRANCH] = true

    }

}

val TranslationResult.additionalNodes: MutableList<Node>
    get() =
        this.scratch.computeIfAbsent("additionalNodes") { mutableListOf<Node>() } as
                MutableList<Node>


operator fun TranslationResult.plusAssign(node: Node) {
    if(!this.additionalNodes.contains(node))
        this.additionalNodes += node
}

