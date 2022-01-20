package de.fraunhofer.aisec.cpg.frontends.solidity.nodes;

import de.fraunhofer.aisec.cpg.graph.SubGraph;
import de.fraunhofer.aisec.cpg.graph.statements.Statement;
import org.jetbrains.annotations.Nullable;
import org.neo4j.ogm.annotation.Relationship;

public class UncheckedStatement extends Statement {
    @Relationship(value = "UNCHECKEDBLOCK", direction = "OUTGOING")
    @SubGraph("AST")
    @Nullable
    private Statement uncheckedBlock;

    @Nullable
    public final Statement getUncheckedBlock() {
        return this.uncheckedBlock;
    }

    public final void setUncheckedBlock(@Nullable Statement var1) {
        this.uncheckedBlock = var1;
        this.uncheckedBlock.addNextDFG(this);
    }

    public UncheckedStatement(@Nullable Statement uncheckedBlock) {
        this.uncheckedBlock = uncheckedBlock;
    }
}
