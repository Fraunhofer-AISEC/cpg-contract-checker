package de.fraunhofer.aisec.cpg.frontends.solidity.nodes

import de.fraunhofer.aisec.cpg.graph.Node
import de.fraunhofer.aisec.cpg.graph.statements.expressions.CallExpression
import de.fraunhofer.aisec.cpg.graph.statements.expressions.Expression
import org.neo4j.ogm.annotation.Relationship

class Return: Node() {

    @field:Relationship(value = "RETURNS", direction = Relationship.Direction.OUTGOING)
    var returns: CallExpression? = null
        set(var1) {
            field = var1
            returns!!.addNextDFG(this)
        }
}