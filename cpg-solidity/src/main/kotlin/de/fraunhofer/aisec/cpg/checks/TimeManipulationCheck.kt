package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Transaction

class TimeManipulationCheck : Check() {

    override fun getVulnerabilityName(): String {
        return "Time Manipulation Vulnerability"
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        val findings: MutableList<PhysicalLocation> = mutableListOf()
        val query = object {}.javaClass.getResourceAsStream("/TimeManipulation")?.bufferedReader()?.readText()

        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))
            }
        }
        return findings
    }
}
