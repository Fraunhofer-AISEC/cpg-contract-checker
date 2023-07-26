package de.fraunhofer.aisec.cpg.frontends.solidity.nodes

import de.fraunhofer.aisec.cpg.graph.AST
import de.fraunhofer.aisec.cpg.graph.statements.expressions.Expression
import de.fraunhofer.aisec.cpg.graph.statements.expressions.ExpressionList
import de.fraunhofer.aisec.cpg.graph.statements.expressions.KeyValueExpression
import org.neo4j.ogm.annotation.Relationship

class SpecifiedExpression: Expression() {

    @field:Relationship(value = "EXPRESSION", direction = Relationship.Direction.OUTGOING)
    @AST
    var expression: Expression? = null
        set(var1) {
            field = var1
            expression!!.addNextDFG(this)
        }


    @field:Relationship(value = "specifiers", direction = Relationship.Direction.OUTGOING)
    @AST
    var specifiers: ExpressionList? = null
        set(var1) {
            field = var1
            specifiers!!.expressions.forEach { it.addNextDFG(this) }
        }
}