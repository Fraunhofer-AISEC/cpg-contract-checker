package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import de.fraunhofer.aisec.cpg.sarif.Region
import org.neo4j.driver.Transaction
import java.net.URI

abstract class Check {

    abstract fun check(transaction: Transaction): List<PhysicalLocation>

    abstract fun getVulnerabilityName(): String

    fun getPhysicalLocationFromResult(row: Map<String, Any>): PhysicalLocation{
        return PhysicalLocation(getUriFromAny(row.get("file")), Region( anyToNumber(row.get("sline")), anyToNumber(row.get("scol")), anyToNumber(row.get("eline")), anyToNumber(row.get("ecol"))))
    }

    fun getUriFromAny(value: Any?): URI{
        value?.let {
            return URI.create(it.toString())
        }
        return URI.create("")
    }

    fun anyToNumber(value: Any?): Int {
        value?.let {
            return Integer.parseInt(it.toString())
        }
        return -1
    }

    fun configurePaths(query: String?): String? {
        query?.let {
            return query.replace("*#", "*")
        }
        return null
    }
}