package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Transaction

class DefaultProxyDelegateCheck : Check() {
    override fun getVulnerabilityName(): String {
        return "No whitelisting of calls proxied to another contract"
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        var findings: MutableList<PhysicalLocation> = mutableListOf()
        val query =object {}.javaClass.getResourceAsStream("/DefaultProxyDelegate")?.bufferedReader()?.readText()

        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))

            }
        }
        return findings
    }
}