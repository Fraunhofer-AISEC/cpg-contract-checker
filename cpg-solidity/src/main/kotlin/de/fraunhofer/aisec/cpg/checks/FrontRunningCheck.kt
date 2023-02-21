package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Transaction

class FrontRunningCheck  : Check() {

    override fun getVulnerabilityName(): String {
        return "A miner can use others input to gain a benefit himself."
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        var findings: MutableList<PhysicalLocation> = mutableListOf()

        // Adding secondary query that checks if one of our state changes can be influenced by a padded value
        var query =object {}.javaClass.getResourceAsStream("/FrontRunning")?.bufferedReader()?.readText()

        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))

            }
        }
        return findings
    }
}