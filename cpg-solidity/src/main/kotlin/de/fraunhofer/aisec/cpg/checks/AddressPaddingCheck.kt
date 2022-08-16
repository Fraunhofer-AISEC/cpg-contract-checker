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
            "match p=({name: \"address\"})<-[:TYPE]-(ad)<-[adr:PARAMETERS]-(f:FunctionDeclaration)-[:EOG|INVOKES*]->(c:CallExpression)-[:EOG|INVOKES*]->(last)<--(f)\n" +
                    "    where (toUpper(c.name) in ['TRANSFER' , 'SEND']\n" +
                    "        and exists{\n" +
                    "            (f)-[r:PARAMETERS]->(param:ParamVariableDeclaration)-[:DFG*]->()<-[:ARGUMENTS]-(c)\n" +
                    "            where not exists {(f)-[rp:PARAMETERS]->() where rp.INDEX > r.INDEX} and adr.INDEX < r.INDEX\n" +
//                    "            }\n" +
                    "        }\n" +
                    "        or exists{\n" +
                    "            (f)-[r:PARAMETERS]->(param:ParamVariableDeclaration)-[:DFG*]->()<-[:VALUE]-(s)-[:KEY]->({value: 'value'})\n" +
                    "            where exists{(s)<--(c)} and not exists {(f)-[rp:PARAMETERS]->() where rp.INDEX > r.INDEX} and adr.INDEX < r.INDEX\n" +
                    "        }\n" +
                    "        or toUpper(c.name) in ['VALUE'] and exists{\n" +
                    "            (f)-[r:PARAMETERS]->(param:ParamVariableDeclaration)-[:DFG*]->()<-[:ARGUMENTS]-(c)-[:BASE*]->({name:'call'})\n" +
                    "            where not exists {(f)-[rp:PARAMETERS]->() where rp.INDEX > r.INDEX} and adr.INDEX < r.INDEX\n" +
                    "        })\n" +
                    "    and not exists{\n" +
                    "        ({code : 'msg.data.length'})-[:DFG*]->(n)\n" +
                    "        where n in nodes(p)\n" +
                    "        and exists{alt=(n)-[:EOG|INVOKES*]->(t) where not 'ROLLBACK' in labels(t) and not c in nodes(alt)}\n" +
                    "                        }\n" +
                    "        and exists{\n" +
                    "            (c)-[:BASE*]->()<-[:DFG*]-(:ParamVariableDeclaration)\n" +
                    "        }\n" +
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