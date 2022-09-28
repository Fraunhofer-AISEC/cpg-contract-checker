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
        val baseReentrency = "match p=(base)-[:BASE]-(c:CallExpression)-[e:EOG*]->(n)-[d:DFG*]->(ex:Expression)-[g]->()-[:REFERS_TO]->(:FieldDeclaration)\n" +
                "where not type(g) in ['EOG','DFG']\n" +
                "and (not exists  {()-[:DFG]->(b1)<-[:BASE*]-(c)} \n" +
                "or exists {\n" +
                "    (s)-[:DFG*]->(b2)<-[:BASE*]-(c)\n" +
                "    where not exists (()-[:DFG]->(s)) and  not 'Literal' in labels(s) and not  exists((s)<-[:PARAMETERS]-(:ConstructorDeclaration)) and (not s.isInferred or s.name in ['msg', 'tx'] )\n" +
                "})\n" +
                "return distinct  c as call, c.startLine as sline, c.endLine as eline, c.startColumn as scol, c.endColumn as ecol, c.artifact as file, c.name as name"
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