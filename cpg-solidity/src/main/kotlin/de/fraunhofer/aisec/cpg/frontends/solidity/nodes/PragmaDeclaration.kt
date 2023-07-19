package de.fraunhofer.aisec.cpg.frontends.solidity.nodes

import de.fraunhofer.aisec.cpg.graph.AST
import de.fraunhofer.aisec.cpg.graph.declarations.Declaration
import de.fraunhofer.aisec.cpg.graph.edge.PropertyEdge
import de.fraunhofer.aisec.cpg.graph.statements.Statement
import de.fraunhofer.aisec.cpg.graph.statements.expressions.BinaryOperator
import de.fraunhofer.aisec.cpg.graph.statements.expressions.Expression
import org.neo4j.ogm.annotation.Relationship

class PragmaDeclaration : Declaration() {

        @field:Relationship(value = "EXPRESSIONS", direction = Relationship.Direction.OUTGOING)
        @AST
        var expressions: MutableList<BinaryOperator> = mutableListOf()
}