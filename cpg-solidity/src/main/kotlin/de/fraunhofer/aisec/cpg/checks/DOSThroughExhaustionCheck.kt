package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Transaction

class DOSThroughExhaustionCheck : Check() {

    override fun getVulnerabilityName(): String {
        return "An expensive operation in a loop with a user controlled or often repeated condition can exhaust gas and deny reliable execution."
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        var findings: MutableList<PhysicalLocation> = mutableListOf()
        val query = object {}.javaClass.getResourceAsStream("/DOSThroughExhaustion")?.bufferedReader()?.readText()

        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))

            }
        }
        return findings
    }
}