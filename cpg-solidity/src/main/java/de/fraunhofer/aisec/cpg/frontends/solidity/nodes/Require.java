package de.fraunhofer.aisec.cpg.frontends.solidity.nodes;

import de.fraunhofer.aisec.cpg.graph.SubGraph;
import de.fraunhofer.aisec.cpg.graph.statements.expressions.Expression;
import org.jetbrains.annotations.Nullable;
import org.neo4j.ogm.annotation.Relationship;

public class Require extends Expression {
    @Relationship(value = "CONDITION", direction = "OUTGOING")
    @SubGraph("AST")
    @Nullable
    private Expression condition;

    @Relationship(value = "MESSAGE",direction = "OUTGOING")
    @SubGraph("AST")
    @Nullable
    private Expression message;

    @Nullable
    public final Expression getCondition() {
        return this.condition;
    }

    public final void setCondition(@Nullable Expression var1) {
        this.condition = var1;
    }


    @Nullable
    public final Expression getMessage() {
        return this.message;
    }

    public final void setMessage(@Nullable Expression var1) {
        this.message = var1;
    }
}