package de.fraunhofer.aisec.cpg.frontends.solidity.nodes;

import de.fraunhofer.aisec.cpg.graph.SubGraph;
import de.fraunhofer.aisec.cpg.graph.statements.expressions.Expression;
import org.jetbrains.annotations.Nullable;
import org.neo4j.ogm.annotation.Relationship;

public class Revert extends Expression {
    @Relationship(value = "MESSAGE", direction = "OUTGOING")
    @SubGraph("AST")
    @Nullable
    private Expression message;

    @Nullable
    public final Expression getMessage() {
        return this.message;
    }

    public final void setMessage(@Nullable Expression var1) {
        this.message = var1;
    }
}
