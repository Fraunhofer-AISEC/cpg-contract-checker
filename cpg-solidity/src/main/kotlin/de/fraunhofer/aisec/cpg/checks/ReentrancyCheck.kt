package de.fraunhofer.aisec.cpg.checks

import org.neo4j.driver.Record
import org.neo4j.driver.Transaction

class ReentrancyCheck: Check() {
    override fun check(transaction: Transaction): Boolean {
        val baseReentrency = "match p=(s)-[:DFG*]->(b)-[:BASE]-(c:CallExpression)-[e:EOG*]->(n)-[d:DFG*]->(ex:Expression)-[g]->()-[:REFERS_TO]->(:FieldDeclaration) where not type(g) in ['EOG','DFG'] and not exists (()-[:DFG]->(s)) and not 'Literal' in labels(s) and (not 'ParamVariableDeclaration' in labels(s)or exists((s)--(:ConstructorDeclaration)))return c"
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