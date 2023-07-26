package de.fraunhofer.aisec.cpg.frontends.solidity.nodes

import de.fraunhofer.aisec.cpg.graph.AST
import de.fraunhofer.aisec.cpg.graph.statements.expressions.Expression
import org.neo4j.ogm.annotation.Relationship

class Require : Expression() {
    @field:Relationship(value = "CONDITION", direction = Relationship.Direction.OUTGOING)
    @AST
    var condition: Expression? = null
        set(var1) {
            field = var1
            condition!!.addNextDFG(this)
        }

    @field:Relationship(value = "MESSAGE", direction = Relationship.Direction.OUTGOING)
    @AST
    var message: Expression? = null
        set(var1) {
            field = var1
            message!!.addNextDFG(this)
        }
}