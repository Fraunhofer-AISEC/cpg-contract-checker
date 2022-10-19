package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Transaction

class TXOriginCheck: Check() {
    override fun getVulnerabilityName(): String {
        return "Access control enforcement through transactions origin is vulnerable to phishing attacks "
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        var findings: MutableList<PhysicalLocation> = mutableListOf()
        val query =
            "match (b1)<-[:EOG]-(n)-[:EOG]->(b2)\n" +
                    "where b1 <> b2 and exists (({code : 'tx.origin'})-[:DFG*]->(n)) and (\n" +
                    "    exists ((:FieldDeclaration)-[:DFG*]->(n)) \n" +
                    "    or exists ((:FieldDeclaration)<-[:REFERS_TO]-()-[:DFG*]->(n)) \n" +
                    ")\n" +
                    "return distinct n as write, n.startLine as sline, n.endLine as eline, n.startColumn as scol, n.endColumn as ecol, n.artifact as file"

        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))

            }
        }
        return findings
    }
}