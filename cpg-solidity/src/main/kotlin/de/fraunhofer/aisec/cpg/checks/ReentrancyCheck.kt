package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Record
import org.neo4j.driver.Transaction

class ReentrancyCheck: Check() {

    val nonExternalCalls: List<String> = listOf("transfer")


    override fun getVulnerabilityName(): String {
        return "Reentrancy Vulnerability"
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        val baseReentrency = object {}.javaClass.getResourceAsStream("/Reentrancy")?.bufferedReader()?.readText()
        var findings: MutableList<PhysicalLocation> = mutableListOf()
            transaction.run(baseReentrency).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))

            }
        }
        return findings
    }
}