package de.fraunhofer.aisec.cpg.checks

import org.neo4j.driver.Transaction

abstract class Check {

    abstract fun check(transaction: Transaction): Boolean
}