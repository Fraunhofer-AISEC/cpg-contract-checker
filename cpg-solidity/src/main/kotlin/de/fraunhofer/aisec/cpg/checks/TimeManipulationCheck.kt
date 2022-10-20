package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Record
import org.neo4j.driver.Transaction

class TimeManipulationCheck: Check() {

    override fun getVulnerabilityName(): String {
        return "Time Manipulation Vulnerability"
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        var findings: MutableList<PhysicalLocation> = mutableListOf()
        val query = """
            MATCH (n) 
            RETURN n 
            LIMIT 25
        """.trimIndent()
        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))
            }
        }
        return findings
    }
}
