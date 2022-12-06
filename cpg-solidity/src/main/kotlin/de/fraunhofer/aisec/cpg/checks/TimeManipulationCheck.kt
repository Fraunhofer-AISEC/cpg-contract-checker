package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Record
import org.neo4j.driver.Transaction

class TimeManipulationCheck: Check() {

    override fun getVulnerabilityName(): String {
        return "Time Manipulation Vulnerability"
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        var findings: MutableList<PhysicalLocation> = mutableListOf()
        val query = """
            MATCH p=(n:DeclaredReferenceExpression)-[:DFG*]->(m) -[:EOG*]->(l:CallExpression)
            WHERE n.name = "timestamp" AND l.name = "send"
            RETURN distinct n as time, n.startLine as sline, n.endLine as eline, n.startColumn as scol, n.endColumn as ecol, n.artifact as file
        """.trimIndent()
        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))
            }
        }
        return findings
    }
}
