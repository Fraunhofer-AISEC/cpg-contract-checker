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
        val query =
            "match p=(:FunctionDeclaration)-[:EOG|INVOKES*]->(c:CallExpression)-[:EOG|INVOKES*]->(last)\n" +
                    "where toUpper(c.name) in ['SELFDESTRUCT' , 'SUICIDE'] \n" +
                    "and not exists ((last)-[:EOG|INVOKES]->()) \n" +
                    "and not 'Rollback' in labels(last) \n" +
                    "and not exists{\n" +
                    "    ({code : 'msg.sender'})-[:DFG*]->(n)<-[:DFG*]-(:FieldDeclaration) \n" + // Here we might have to consider refers to to Field declarations and not strait data flows
                    "    where n in nodes(p)\n" +
                    "    and exists{\n" +
                    "        alt=(n)-[:EOG|INVOKES*]->(t) where not 'Rollback' in labels(t) and not c in nodes(alt)\n" +
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