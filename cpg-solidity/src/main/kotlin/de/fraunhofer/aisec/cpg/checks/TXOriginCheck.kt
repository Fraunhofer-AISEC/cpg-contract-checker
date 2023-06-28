package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Transaction

class TXOriginCheck: Check() {
    override fun getVulnerabilityName(): String {
        return "Access control enforcement through transactions origin is vulnerable to phishing attacks "
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        var findings: MutableList<PhysicalLocation> = mutableListOf()
        var query =object {}.javaClass.getResourceAsStream("/TXOrigin")?.bufferedReader()?.readText()
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