package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Transaction

class AccessControlLogicCheck  : Check() {

    override fun getVulnerabilityName(): String {
        return "Overly permissive writes to access control variables"
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        var findings: MutableList<PhysicalLocation> = mutableListOf()
        val query =
            "match p=(entry:FunctionDeclaration)-[e:EOG|INVOKES|RETURNS*]->(writingNode)-[:EOG|INVOKES*]->(last)\n" +
                    "where not 'ConstructorDeclaration' in labels(entry) and not exists((last)-[:EOG|INVOKES]->()) and exists((writingNode)-[:DFG]->(:FieldDeclaration)<-[:REFERS_TO]-()<-[:LHS|RHS]-(:BinaryOperator {operatorCode: '=='})-[:LHS|RHS]->({code: 'msg.sender'})) \n" +
                    "and not exists{\n" +
                    "   ({code : 'msg.sender'})-[:DFG*]->(n)<-[:DFG*]-(:FieldDeclaration)\n" +
                    "   where n in nodes(p)\n" +
                    "   and exists{\n" +
                    "   alt=(n)-[:EOG|INVOKES*]->(t) where 'Rollback' in labels(t) or not writingNode in nodes(alt)\n" +
                    "   }\n" +
                    "}\n" +
                    "return distinct writingNode as write, writingNode.startLine as sline, writingNode.endLine as eline, writingNode.startColumn as scol, writingNode.endColumn as ecol, writingNode.artifact as file"

        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))

            }
        }
        return findings
    }
}