package de.fraunhofer.aisec.cpg.frontends.solidity.nodes

import de.fraunhofer.aisec.cpg.graph.Node
import org.neo4j.ogm.annotation.Relationship

data class Version(val operator: String, val major: Int, val minor: Int, val patch: Int): Node(), Comparable<Version> {
    override operator fun compareTo(other: Version): Int {
        if (this.major > other.major) return 1
        if (this.minor > other.minor) return 1
        if (this.patch > other.patch) return 1
        if(!this.operator.equals(other.operator)){
            if(this.operator.equals(">") && other.operator.equals(">=")) return 1
            if(this.operator.equals(">=") && other.operator.equals(">")) return -1
            if(this.operator.equals("<") && other.operator.equals("<=")) return -1
            if(this.operator.equals("<=") && other.operator.equals("<")) return 1
        }
        return 0
    }
}