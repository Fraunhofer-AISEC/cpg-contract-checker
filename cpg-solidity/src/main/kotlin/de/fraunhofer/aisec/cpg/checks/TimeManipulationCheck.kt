package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Transaction

class TimeManipulationCheck : Check() {

    override fun getVulnerabilityName(): String {
        return "Miners can manipulate program execution by selecting when to include the timestamp"
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        val findings: MutableList<PhysicalLocation> = mutableListOf()
        var query = object {}.javaClass.getResourceAsStream("/TimeManipulation")?.bufferedReader()?.readText()
        query = configurePaths(query)

        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))
            }
        }
        return findings
    }
}
