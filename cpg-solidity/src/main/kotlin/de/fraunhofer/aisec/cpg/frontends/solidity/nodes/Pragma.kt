package de.fraunhofer.aisec.cpg.frontends.solidity.nodes

import de.fraunhofer.aisec.cpg.graph.SubGraph
import de.fraunhofer.aisec.cpg.graph.declarations.Declaration
import de.fraunhofer.aisec.cpg.graph.statements.expressions.Expression
import org.neo4j.ogm.annotation.Relationship

class Pragma: Declaration() {
    @field:Relationship(value = "MINIMAL", direction = "OUTGOING")
    var minimal: Version? = null
        set(var1) {
            field = var1
        }

    @field:Relationship(value = "MAXIMAL", direction = "OUTGOING")
    var maximal: Version? = null
        set(var1) {
            field = var1
        }
}