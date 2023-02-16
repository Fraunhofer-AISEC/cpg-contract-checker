package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Transaction

class BadRandomnessCheck  : Check() {

    override fun getVulnerabilityName(): String {
        return "Bad randomness"
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        val findings: MutableList<PhysicalLocation> = mutableListOf()
        val query = object {}.javaClass.getResourceAsStream("/CallReturn")?.bufferedReader()?.readText()
        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))

            }
        }
        return findings
    }
}