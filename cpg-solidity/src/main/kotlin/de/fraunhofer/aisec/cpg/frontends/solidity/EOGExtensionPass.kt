package de.fraunhofer.aisec.cpg.frontends.solidity

import de.fraunhofer.aisec.cpg.TranslationResult
import de.fraunhofer.aisec.cpg.frontends.CallableInterface
import de.fraunhofer.aisec.cpg.frontends.solidity.nodes.*
import de.fraunhofer.aisec.cpg.graph.Node
import de.fraunhofer.aisec.cpg.graph.declarations.FunctionDeclaration
import de.fraunhofer.aisec.cpg.graph.declarations.NamespaceDeclaration
import de.fraunhofer.aisec.cpg.graph.declarations.RecordDeclaration
import de.fraunhofer.aisec.cpg.graph.declarations.TranslationUnitDeclaration
import de.fraunhofer.aisec.cpg.graph.edge.PropertyEdge
import de.fraunhofer.aisec.cpg.helpers.SubgraphWalker
import de.fraunhofer.aisec.cpg.passes.EvaluationOrderGraphPass
import java.util.function.Consumer
import java.util.stream.Collectors

class EOGExtensionPass: EvaluationOrderGraphPass() {

    private var tr: TranslationResult? = null

    init {
        map[UncheckedStatement::class.java] = CallableInterface(::handleUncheckedStatement)
        map[EmitStatement::class.java] = CallableInterface(::handleEmitStatement)
        map[Revert::class.java] = CallableInterface(::handleRevert)
        map[Require::class.java] = CallableInterface(::handleRequire)
    }

    override fun accept(result: TranslationResult) {
        tr = result
        for (tu in result.translationUnits) {
            createEOG(tu)
            overriddenRemoveUnreachableEOGEdges(tu!!)
            // checkEOGInvariant(tu); To insert when trying to check if the invariant holds
        }
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

    private fun handleRevert(node: Node) {
        val revert: Revert = node as Revert

        createEOG(revert.message)
        pushToEOG(node)

        val solidityLanguageFrontend = lang as SolidityLanguageFrontend

        solidityLanguageFrontend?.scopeManager?.currentFunction?.let {

            val rollback = solidityLanguageFrontend.rollbackNodes.getOrPut(it) {Rollback()}
            pushToEOG(rollback)
            tr?.let { it += rollback }
        }

        currentEOG.clear()


    }

    private fun handleRequire(node: Node) {
        val require: Require = node as Require

        require.message?.let {  createEOG(it) }
        createEOG(require.condition)
        pushToEOG(node)


        val openBranchNodes: List<Node> = ArrayList()
        val openConditionEOGs: List<Node> = ArrayList(currentEOG)
        //currentProperties[Properties.BRANCH] = false

        val solidityLanguageFrontend = lang as SolidityLanguageFrontend
        solidityLanguageFrontend?.scopeManager?.currentFunction?.let {

            val rollback = solidityLanguageFrontend.rollbackNodes.getOrPut(it) {Rollback()}
            pushToEOG(rollback)
            tr?.let { it += rollback }
        }

        currentEOG.clear()

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