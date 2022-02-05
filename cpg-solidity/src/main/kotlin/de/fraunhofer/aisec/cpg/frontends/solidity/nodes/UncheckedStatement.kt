package de.fraunhofer.aisec.cpg.frontends.solidity.nodes

import de.fraunhofer.aisec.cpg.graph.SubGraph
import de.fraunhofer.aisec.cpg.graph.statements.Statement
import de.fraunhofer.aisec.cpg.graph.statements.expressions.Expression
import org.neo4j.ogm.annotation.Relationship

class UncheckedStatement() : Statement() {

    @field:Relationship(value = "UNCHECKEDBLOCK", direction = "OUTGOING")
    @field:SubGraph("AST")
    var uncheckedBlock: Statement? = null
        set(var1) {
            field = var1
            uncheckedBlock!!.addNextDFG(this)
        }
}