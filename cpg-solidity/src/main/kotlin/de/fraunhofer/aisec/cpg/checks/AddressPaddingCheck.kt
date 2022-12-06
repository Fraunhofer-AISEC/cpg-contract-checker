package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Transaction

class AddressPaddingCheck : Check() {

    override fun getVulnerabilityName(): String {
        return "Message padding vulnerability found at ether transfer."
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        var findings: MutableList<PhysicalLocation> = mutableListOf()

        // Adding secondary query that checks if one of our state changes can be influenced by a padded value
        var query =object {}.javaClass.getResourceAsStream("/AddressPaddingStateChange")?.bufferedReader()?.readText()

        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))

            }
        }
        // A query that finds if we make an external call and potentially forward attacked values
        query =object {}.javaClass.getResourceAsStream("/AddressPaddingAtCall")?.bufferedReader()?.readText()

        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))

            }
        }
        return findings
    }
}