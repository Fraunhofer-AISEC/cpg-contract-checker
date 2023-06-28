package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Transaction

class OverUnderflowCheck: Check() {

    override fun getVulnerabilityName(): String {
        return "Result of expression can be over- or under-flown by external entity"
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        var findings: MutableList<PhysicalLocation> = mutableListOf()
        var query = object {}.javaClass.getResourceAsStream("/OverUnderflow")?.bufferedReader()?.readText()
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