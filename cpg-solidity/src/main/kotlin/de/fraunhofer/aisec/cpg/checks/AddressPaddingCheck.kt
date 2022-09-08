package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Transaction

class AddressPaddingCheck : Check() {

    override fun getVulnerabilityName(): String {
        return "Message padding vulnerability found at ether transfer."
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        var findings: MutableList<PhysicalLocation> = mutableListOf()

        // Adding secondary query that checks if one of our state changes can be influenced by a padded value
        var query =
            "match p=({name: \"address\"})<-[:TYPE]-(ad)<-[adr:PARAMETERS]-(f:FunctionDeclaration)-[:EOG|INVOKES*]->(last)\n" +
                    "    where 'ReturnStatement' in labels(last) or exists {(f)-[:BODY]->(last)} \n" +
                    "        and exists{\n" +
                    "        (f)-[vulna:PARAMETERS]->(vuln)-[:DFG*]->(m)-[:DFG*]->(f:FieldDeclaration) where m in nodes(p) \n" +
                    "            and not exists {(f)-[rp:PARAMETERS]->() where rp.INDEX > vulna.INDEX} and adr.INDEX < vulna.INDEX\n" +
                    "            and not exists{\n" +
                    "                ({code : 'msg.data.length'})-[:DFG*]->(n)\n" +
                    "                where n in nodes(p)\n" +
                    "                and exists{alt=(n)-[:EOG|INVOKES*]->(t) where 'ROLLBACK' in labels(t) or not m in nodes(alt) and not exists {(t)-[:EOG|INVOKES]->()}}\n" +
                    "    }\n" +
                    "    \n" +
                    "                        }\n" +
                    "return distinct ad as call, ad.startLine as sline, ad.endLine as eline, ad.startColumn as scol, ad.endColumn as ecol, ad.artifact as file"

        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))

            }
        }
        // A query that finds if we make an external call and potentially forward attacked values
        query =
            "match p=({name: \"address\"})<-[:TYPE]-(ad)<-[adr:PARAMETERS]-(f:FunctionDeclaration)-[:EOG|INVOKES*]->(c:CallExpression)-[:EOG|INVOKES*]->(last)\n" +
                    "    where 'ReturnStatement' in labels(last) or exists {(f)-[:BODY]->(last)} \n" +
                    "        and (toUpper(c.name) in ['TRANSFER' , 'SEND']\n" +
                    "        and exists{\n" +
                    "            (f)-[r:PARAMETERS]->(param:ParamVariableDeclaration)-[:DFG*]->()<-[:ARGUMENTS]-(c)\n" +
                    "            where not exists {(f)-[rp:PARAMETERS]->() where rp.INDEX > r.INDEX} and adr.INDEX < r.INDEX\n" +
                    "            }\n" +
                    "    \n" +
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
                    "        and exists{alt=(n)-[:EOG|INVOKES*]->(t) where 'ROLLBACK' in labels(t) or not c in nodes(alt) and not exists {(t)-[:EOG|INVOKES]->()}}\n" +
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