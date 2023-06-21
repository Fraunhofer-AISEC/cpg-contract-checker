package de.fraunhofer.aisec.cpg.checks

import de.fraunhofer.aisec.cpg.sarif.PhysicalLocation
import org.neo4j.driver.Transaction

class DOSCheck : Check() {

    override fun getVulnerabilityName(): String {
        return "Operation may lead to a denial of essential contract function."
    }

    override fun check(transaction: Transaction): List<PhysicalLocation> {
        var findings: MutableList<PhysicalLocation> = mutableListOf()

        // Adding secondary query that checks if one of our state changes can be influenced by a padded value
        var query =object {}.javaClass.getResourceAsStream("/DOSThroughExhaustion")?.bufferedReader()?.readText()
        query = configurePaths(query)

        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))

            }
        }
        // A query that finds if we make an external call and potentially forward attacked values
        query =object {}.javaClass.getResourceAsStream("/CallBlocksStateChangesOrCalls")?.bufferedReader()?.readText()
        query = configurePaths(query)

        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))

            }
        }

        // A query that finds if we make an external call whos failure stops other calls from executing
        query =object {}.javaClass.getResourceAsStream("/CallBlocksFutureCall")?.bufferedReader()?.readText()
        query = configurePaths(query)

        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))

            }
        }

        // A query that finds if we make an external call whos failure stops other calls from executing
        query =object {}.javaClass.getResourceAsStream("/EmptyCollectionUsedForTransfers")?.bufferedReader()?.readText()
        query = configurePaths(query)

        transaction.run(query).let { result ->
            while (result.hasNext()) {
                val row: Map<String, Any> = result.next().asMap()
                findings.add(getPhysicalLocationFromResult(row))

            }
        }
        return findings
    }
}