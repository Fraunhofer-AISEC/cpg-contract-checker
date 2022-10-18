package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Transaction

class DefaultProxyDelegateCheck : Check() {
    override fun getVulnerabilityName(): String {
        return "No whitelisting of calls proxied to another contract"
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        var findings: MutableList<PhysicalLocation> = mutableListOf()
        val query =
            "match p=(f:FunctionDeclaration)-[:EOG|INVOKES*]->(c:CallExpression)-[:EOG|INVOKES*]->(last)\n" +
                    "where toUpper(c.name) in ['DELEGATECALL' , 'CALLCODE'] \n" +
                    "and not exists ((last)-[:EOG|INVOKES]->()) \n" +
                    "and not 'Rollback' in labels(last)\n" +
                    "and (exists {\n" +
                    "    ({code: 'msg.data'})<-[:ARGUMENTS]-(c)\n" +
                    "} or exists{({code: 'msg.data'})-[:DFG*]->()<-[:ARGUMENTS]-(c)})\n" +
                    "and not exists{\n" +
                    "    ({code: 'msg.data'})-[:DFG*]->(n)-[:EOG]->(apath) where n in nodes(p) and exists {\n" +
                    "    d=(f)-[:EOG|INVOKES*]->(n)-[:EOG|INVOKES*]->(otherpath) where not exists{ (otherpath)-[:EOG|INVOKES]->() } and not c in nodes(d) or 'Rollback' in labels(otherpath)\n" +
                    "    }\n" +
                    "}\n" +
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