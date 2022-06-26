package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Transaction

class AddressPaddingCheck : Check() {

    override fun getVulnerabilityName(): String {
        return "Message padding vulnerability found at ether transfer."
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        var findings: MutableList<PhysicalLocation> = mutableListOf()
        val query =
            "match p=(:FunctionDeclaration)-[:EOG|INVOKES*]->(c:CallExpression)-[:EOG|INVOKES*]->(last)<--(f)\n" +
                    "where toUpper(c.name) in ['TRANSFER' , 'SEND'] \n" +
                    "and exists{\n" +
                    "    (f)-->(param:ParamVariableDeclaration)-[:DFG*]->()<-[:ARGUMENTS]-(v)\n" +
                    "}\n" +
                    "or exists{\n" +
                    "    (f)-->(param:ParamVariableDeclaration)-[:DFG*]->()<-[:VALUE]-(s)-[:KEY]->({value: 'value'})\n" +
                    "    where exists{\n" +
                    "        (s)<--(c)\n" +
                    "    }\n" +
                    "}\n" +
                    "or toUpper(c.name) in ['VALUE'] and exists{\n" +
                    "    (f)-->(param:ParamVariableDeclaration)-[:DFG*]->()<-[:ARGUMENTS]-(c)-[:BASE*]->({name:'call'})\n" +
                    "}\n" +
                    "return c as call, c.startLine as sline, c.endLine as eline, c.startColumn as scol, c.endColumn as ecol, c.artifact as file\n"

        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))

            }
        }
        return findings
    }
}