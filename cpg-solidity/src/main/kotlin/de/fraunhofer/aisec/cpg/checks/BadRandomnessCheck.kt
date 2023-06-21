package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Transaction

class BadRandomnessCheck  : Check() {

    override fun getVulnerabilityName(): String {
        return "A deterministic or predictable value may be used as bad random number."
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        val findings: MutableList<PhysicalLocation> = mutableListOf()
        var query = object {}.javaClass.getResourceAsStream("/BadRandomness")?.bufferedReader()?.readText()
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