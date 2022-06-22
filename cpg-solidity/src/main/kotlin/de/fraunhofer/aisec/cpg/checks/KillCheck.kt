package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import de.fraunhofer.aisec.cpg.sarif.Region
import org.neo4j.driver.Record
import org.neo4j.driver.Transaction

class KillCheck : Check() {

    override fun getVulnerabilityName(): String {
        return "Missing Access Control to Selfdestruct"
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        var findings: MutableList<PhysicalLocation> = mutableListOf()
        val query = "match p=(s:CallExpression) where toUpper(s.name) in ['SELFDESTRUCT' , 'SUICIDE'] return s as call, s.startLine as sline, s.endLine as eline, s.startColumn as scol, s.endColumn as ecol, s.artifact as file"
        "match p=(:FunctionDeclaration)-[:EOG|INVOKES*]->(:CallExpression)-[:EOG|INVOKES*]->(last) where not exists ((last)-[:EOG|INVOKES]->()) and not 'ROLLBACK' in labels(last) return p"
        "match p=(:FunctionDeclaration)-[:EOG|INVOKES*]->(:CallExpression)-[:EOG|INVOKES*]->(last) where not exists ((last)-[:EOG|INVOKES]->()) and not 'ROLLBACK' in labels(last) and none(n in nodes(p) where exists(({code : 'msg.sender'})-[:DFG*]->(n)<-[:DFG*]-(:FieldDeclaration))) return p"
        "match p=(:FunctionDeclaration)-[:EOG|INVOKES*]->(c:CallExpression)-[:EOG|INVOKES*]->(last) where not exists ((last)-[:EOG|INVOKES]->()) and not 'ROLLBACK' in labels(last) and none(n in nodes(p) where exists(({code : 'msg.sender'})-[:DFG*]->(n)<-[:DFG*]-(:FieldDeclaration) where exists(alt=(n)-[:EOG|INVOKES]->(t) where not ROLLBACK in labels(t) and not c in nodes(alt)))) return p"
        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))

            }
        }
        return findings
    }
}