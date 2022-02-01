package de.fraunhofer.aisec.cpg.frontends.solidity.nodes

import de.fraunhofer.aisec.cpg.graph.SubGraph
import de.fraunhofer.aisec.cpg.graph.statements.expressions.Expression
import org.neo4j.ogm.annotation.Relationship

class Revert : Expression() {
    @field:Relationship(value = "MESSAGE", direction = "OUTGOING")
    @field:SubGraph("AST")
    var message: Expression? = null
        set(var1) {
            field = var1
            message!!.addNextDFG(this)
        }
}