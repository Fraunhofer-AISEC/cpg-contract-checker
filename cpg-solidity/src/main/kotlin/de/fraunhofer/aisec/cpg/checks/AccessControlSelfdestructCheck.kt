package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import de.fraunhofer.aisec.cpg.sarif.Region
import org.neo4j.driver.Record
import org.neo4j.driver.Transaction

class AccessControlSelfdestructCheck : Check() {

    override fun getVulnerabilityName(): String {
        return "Missing Access Control to Selfdestruct"
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        var findings: MutableList<PhysicalLocation> = mutableListOf()
        val query =object {}.javaClass.getResourceAsStream("/AccessControlSelfdestruct")?.bufferedReader()?.readText()

        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))

            }
        }
        return findings
    }
}