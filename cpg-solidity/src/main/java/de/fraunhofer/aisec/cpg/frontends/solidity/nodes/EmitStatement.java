package de.fraunhofer.aisec.cpg.frontends.solidity.nodes;

import de.fraunhofer.aisec.cpg.graph.SubGraph;
import de.fraunhofer.aisec.cpg.graph.statements.Statement;
import de.fraunhofer.aisec.cpg.graph.statements.expressions.Expression;
import org.jetbrains.annotations.Nullable;
import org.neo4j.ogm.annotation.Relationship;

public class EmitStatement extends Statement {
    @Relationship(value = "EMITS", direction = "OUTGOING")
    @SubGraph("AST")
    @Nullable
    private Expression emits;

    @Nullable
    public final Expression getEmits() {
        return this.emits;
    }

    public final void setEmits(@Nullable Expression var1) {
        this.emits = var1;
    }
}
