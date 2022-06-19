package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Record
import org.neo4j.driver.Transaction

class ReentrancyCheck: Check() {


    override fun getVulnerabilityName(): String {
        return "Reentrancy Vulnerability"
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        val baseReentrency = "match p=(s)-[:DFG*]->(b)-[:BASE]-(c:CallExpression)-[e:EOG*]->(n)-[d:DFG*]->(ex:Expression)-[g]->()-[:REFERS_TO]->(:FieldDeclaration) where not type(g) in ['EOG','DFG'] and not exists (()-[:DFG]->(s)) and not 'Literal' in labels(s) and (not 'ParamVariableDeclaration' in labels(s)or exists((s)--(:ConstructorDeclaration)))return c"
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