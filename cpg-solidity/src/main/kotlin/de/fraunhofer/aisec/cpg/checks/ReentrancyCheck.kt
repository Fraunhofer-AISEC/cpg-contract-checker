package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Record
import org.neo4j.driver.Transaction

class ReentrancyCheck: Check() {


    override fun getVulnerabilityName(): String {
        return "Reentrancy Vulnerability"
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        val baseReentrency = "match p=(b)-[:BASE]-(c:CallExpression)-[e:EOG*]->(n)-[d:DFG*]->(ex:Expression)-[g]->()-[:REFERS_TO]->(:FieldDeclaration)\n" +
                "optional match ((s)-[:DFG*]->(b))\n" +
                "where not type(g) in ['EOG','DFG']\n" +
                "and not exists (()-[:DFG]->(s))\n" +
                "and not exists (()-[:DFG]->(b))\n" +
                "and c.name <> 'transfer'\n" +
                "or (\n" +
                "    not 'Literal' in labels(s) \n" +
                "    and (not 'ParamVariableDeclaration' in labels(s)or exists((s)--(:ConstructorDeclaration)))\n" +
                ")\n" +
                "return distinct  c as call, c.startLine as sline, c.endLine as eline, c.startColumn as scol, c.endColumn as ecol, c.artifact as file"
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