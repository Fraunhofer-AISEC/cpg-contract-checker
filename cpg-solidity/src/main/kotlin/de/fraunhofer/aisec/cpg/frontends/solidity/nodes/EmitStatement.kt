package de.fraunhofer.aisec.cpg.frontends.solidity.nodes

import de.fraunhofer.aisec.cpg.graph.SubGraph
import de.fraunhofer.aisec.cpg.graph.statements.Statement
import de.fraunhofer.aisec.cpg.graph.statements.expressions.Expression
import org.neo4j.ogm.annotation.Relationship

class EmitStatement : Statement() {
    @field:Relationship(value = "EMITS", direction = "OUTGOING")
    @field:SubGraph("AST")
    var emits: Expression? = null
        set(var1) {
            field = var1
            emits!!.addNextDFG(this)
        }
}