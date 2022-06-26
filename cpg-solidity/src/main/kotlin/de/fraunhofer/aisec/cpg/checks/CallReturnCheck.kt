package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Transaction

class CallReturnCheck : Check() {

    override fun getVulnerabilityName(): String {
        return "Missing Check of Return Value from external Call"
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        var findings: MutableList<PhysicalLocation> = mutableListOf()
        val query =
            "match p=(c:CallExpression)-[:EOG*]->(last)\n" +
                    "where c.name in ['call', 'callcode', 'delegatecall', 'send', 'transfer'] and not exists ((last)-[:EOG]->()) and not 'Rollback' in labels(last)\n" +
                    "    and not exists{(c)-[:DFG*]->(last) where 'ReturnStatement' in labels(last)} \n" +
                    "    and not exists{(c)-[:DFG*]->(n) where n in nodes(p) \n" +
                    "        and exists((n)-[:EOG*]->(:Rollback)) \n" +
                    "    }\n" +
                    "return distinct c as call, c.startLine as sline, c.endLine as eline, c.startColumn as scol, c.endColumn as ecol, c.artifact as file"

        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))

            }
        }
        return findings
    }
}