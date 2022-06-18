package de.fraunhofer.aisec.cpg.checks

import org.neo4j.driver.Record
import org.neo4j.driver.Transaction

class KillCheck : Check() {
    override fun check(transaction: Transaction): Boolean {
        val baseReentrency = "match p=(s:CallExpression) where toUpper(s.name) in ['SELFDESTRUCT' , 'SUICIDE'] return s"
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