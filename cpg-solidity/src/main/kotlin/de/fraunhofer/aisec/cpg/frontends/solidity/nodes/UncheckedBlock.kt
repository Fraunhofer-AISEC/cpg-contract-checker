package de.fraunhofer.aisec.cpg.frontends.solidity.nodes

import de.fraunhofer.aisec.cpg.graph.Node
import de.fraunhofer.aisec.cpg.graph.statements.CompoundStatement
import de.fraunhofer.aisec.cpg.graph.statements.Statement
import org.neo4j.ogm.annotation.Relationship

/**
 * used to represent a block of code where arithmetic operations causing an over- or underflow will not cause a
 */
class UncheckedStatement(): Statement() {

    @field:Relationship(value = "UNCHECKEDBLOCK", direction = "OUTGOING")
    var uncheckedBlock: Statement? = null;

}