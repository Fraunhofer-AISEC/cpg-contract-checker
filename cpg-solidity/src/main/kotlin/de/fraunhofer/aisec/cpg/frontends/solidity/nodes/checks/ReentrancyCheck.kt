package de.fraunhofer.aisec.cpg.frontends.solidity.nodes.checks

import org.neo4j.driver.Record
import org.neo4j.driver.Transaction

class ReentrancyCheck: Check() {
    override fun check(transaction: Transaction): Boolean {
        val baseReentrency = "match p=(c:CallExpression)-[e:EOG*]->(n)-[d:DFG*]->(ex:Expression)-[g]->()-[:REFERS_TO]->(:FieldDeclaration) where not type(g) in ['EOG','DFG'] return c"
        transaction.run(baseReentrency).let { result ->
            while (result.hasNext()) {
                val row: Record = result.next()
                for ((key, value) in row.asMap()) {
                    return true
                }
            }
        }
        return false
    }
}