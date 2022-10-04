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
                "}) and not exists{\n" +
                "    r=(cd)-[:EOG*]->(l1:Literal)-[:EOG*]->()-[:EOG*]->(l2:Literal)\n" +
                "where l1.value <> l2.value and exists{(l1:Literal)-[:DFG*]->(f:FieldDeclaration)<-[:DFG*]-(l2:Literal)} and (cd in nodes(p) and n in nodes(r) or l2 in nodes(r) and c in nodes(p) or c in nodes(r) and n in nodes(r) and l2 in nodes(r)) and\n" +
                "    exists{ q=(cd)-[:EOG*]->(pathend) where not exists ((pathend)-[:EOG]->()) and all(altn in nodes(q) where altn = cd or not altn in nodes(r) )\n" +
                "    and (exists {\n" +
                "        (f)<-[:REFERS_TO]-({access: 'READ'})<--(bin:BinaryOperator {operatorCode: '=='})-->(cl:Literal) where cl.value = l2.value and exists ((bin)-[:DFG]->(cd)) \n" +
                "    }or not exists ((:BinaryOperator)-[:DFG]->(cd)) and (exists {\n" +
                "        (f)<-[:REFERS_TO]-({access: 'READ'})-[:DFG]->(un:UnaryOperator)-[:DFG]->(cd) where un.operatorCode = '!' and l1.value = true\n" +
                "    }\n" +
                "    or not exists ((:UnaryOperator)-[:DFG]->(cd)) and exists {\n" +
                "        (f)<-[:REFERS_TO]-({access: 'READ'})-[:DFG*]->(cd) where l1.value = false\n" +
                "    })\n" +
                "    )\n" +
                "}\n" +
                "}\n" +
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