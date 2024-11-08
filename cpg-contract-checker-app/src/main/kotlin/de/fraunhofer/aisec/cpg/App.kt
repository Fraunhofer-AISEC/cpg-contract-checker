/*
 * Copyright (c) 2024, Fraunhofer AISEC. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * ╔═╗╔═╗╔═╗   ╔═╗┌─┐┌┐┌┌┬┐┬─┐┌─┐┌─┐┌┬┐  ╔═╗┬ ┬┌─┐┌─┐┬┌─┌─┐┬─┐
 * ║  ╠═╝║ ╦───║  │ ││││ │ ├┬┘├─┤│   │───║  ├─┤├┤ │  ├┴┐├┤ ├┬┘
 * ╚═╝╩  ╚═╝   ╚═╝└─┘┘└┘ ┴ ┴└─┴ ┴└─┘ ┴   ╚═╝┴ ┴└─┘└─┘┴ ┴└─┘┴└─
 *
 */
package de.fraunhofer.aisec.cpg

import de.fraunhofer.aisec.cpg.checks.*
import de.fraunhofer.aisec.cpg.frontends.solidity.*
import de.fraunhofer.aisec.cpg.graph.Node
import de.fraunhofer.aisec.cpg.graph.statements.expressions.CallExpression
import de.fraunhofer.aisec.cpg.helpers.Benchmark
import de.fraunhofer.aisec.cpg.helpers.SubgraphWalker
import java.io.File
import java.net.ConnectException
import java.nio.file.Files
import java.nio.file.Paths
import java.util.concurrent.Callable
import java.util.stream.Collectors
import kotlin.reflect.full.memberProperties
import kotlin.reflect.jvm.javaField
import kotlin.system.exitProcess
import kotlin.system.measureTimeMillis
import org.codehaus.jettison.json.JSONObject
import org.codehaus.jettison.json.JSONTokener
import org.neo4j.driver.AuthTokens
import org.neo4j.driver.GraphDatabase
import org.neo4j.driver.Transaction
import org.neo4j.driver.exceptions.AuthenticationException
import org.neo4j.ogm.config.Configuration
import org.neo4j.ogm.exception.ConnectionException
import org.neo4j.ogm.session.Session
import org.neo4j.ogm.session.SessionFactory
import org.neo4j.ogm.session.event.Event
import org.neo4j.ogm.session.event.EventListenerAdapter
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import picocli.CommandLine

private const val MAX_COUNT_OF_FAILS = 10
private const val PROTOCOL = "bolt://"
private const val AUTO_INDEX = "none"
private const val VERIFY_CONNECTION = true
private const val TIME_BETWEEN_CONNECTION_TRIES: Long = 2000
private const val EXIT_SUCCESS = 0
private const val EXIT_FAILURE = 1

private const val DEFAULT_HOST = "localhost"
private const val DEFAULT_PORT = 7687
private const val DEFAULT_USER_NAME = "neo4j"
private const val DEFAULT_PASSWORD = "password"
private const val DEFAULT_SAVE_DEPTH = -1

class App : Callable<Int> {

    private val logger = LoggerFactory.getLogger(App::class.java)

    private val compDurations: MutableMap<String, Long> = mutableMapOf()

    private val PRINT_ON_FIND = true

    private var host: String = DEFAULT_HOST

    private var port: Int = DEFAULT_PORT

    var neo4jUsername: String = DEFAULT_USER_NAME
    private var depth: Int = DEFAULT_SAVE_DEPTH

    @CommandLine.Parameters(arity = "0..*", description = ["The files to analyze."])
    var files: List<String> = mutableListOf()

    @CommandLine.Option(
        names = ["--verify-checks", "-vc"],
        description = ["Provide a comma separated list of checks"]
    )
    var optInChecks: String = ""

    @CommandLine.Option(names = ["--neo4j-password"], description = ["The Neo4j password"])
    var neo4jPassword: String = "password"
    var checks: MutableList<Check> = mutableListOf()
    var avChecks: MutableList<Check> = mutableListOf()

    var findings: MutableMap<String, MutableList<String>> = mutableMapOf()
    private var noPurgeDb: Boolean = false

    private val log: Logger
        get() = LoggerFactory.getLogger(App::class.java)

    override fun call(): Int {
        registerChecks()
        var nr_checked_files = 0
        if (files.isEmpty()) {
            files = files.flatMap { getAllSolFiles(it) }
            // files = listOf<Path>(Path.of(base + "/" + "66617876_2.sol"))
            // files =
            // listOf<Path>(Path.of("/home/kweiss/coding/cpg-contract-checker/cpg-solidity/src/test/resources/examples/" + "SelfDestruct.sol"))
        }
        for (path in files) {
            println(path)
            val start = System.currentTimeMillis()
            val tr = getGraph(path)
            var duration = System.currentTimeMillis() - start
            compDurations["Graph translation"] = compDurations["Graph translation"] ?: 0 + duration
            tr.translationUnits.forEach {
                if (
                    SubgraphWalker.flattenAST(it).size <= 0
                ) { // Turnin this off for now as in the snippet case there are some that contain
                    // only pragmas and imports and nothig inside of a record
                    if (!findings.containsKey("Empty translation")) {
                        findings["Empty translation"] = mutableListOf()
                    }
                    findings["Empty translation"]!!.add(it.name.toString())
                }
            }
            duration = measureTimeMillis { persistGraph(tr) }
            compDurations["Persisting graph"] = compDurations["Persisting graph"] ?: 0 + duration
            println("Running checks")
            duration = measureTimeMillis { runVulnerabilityChecks(path) }
            compDurations["All checks"] = compDurations["All checks"] ?: 0 + duration
            nr_checked_files++
            println("Nr. Files: " + nr_checked_files)
        }
        findings.forEach { (k, v) ->
            println("File: " + k)
            v.forEach { e -> println("- " + e) }
        }
        var durationsString = ""
        compDurations.forEach { (k, v) -> durationsString += k + ": " + v + " ms, " }
        print(durationsString.dropLast(2) + "\n")
        return 0
    }

    fun getAllSolFiles(path: String): MutableList<String> {
        val path = Paths.get(path)
        return Files.walk(path)
            .filter { item -> Files.isRegularFile(item) }
            .map { it.toString() }
            .filter { item -> item.endsWith(".sol") }
            .collect(Collectors.toList())
    }

    fun getGraph(filename: String): TranslationResult {
        updateChecks(filename)
        var path = filename
        val config =
            TranslationConfiguration.builder()
                .topLevel(File(path))
                .sourceLocations(File(path))
                .defaultPasses()
                .registerLanguage<SolidityLanguage>()
                // .registerPass<EOGExtensionPass>()
                .registerPass<DFGExtensionPass>()
                .registerPass<GraphExtensionsPass>()
                .debugParser(true)
                .processAnnotations(true)
                .inferenceConfiguration(InferenceConfiguration.builder().build())
                .build()

        val analyzer = TranslationManager.builder().config(config).build()
        val o = analyzer.analyze()
        return o.get()
    }

    fun registerChecks() {

        avChecks.add(AccessControlSelfdestructCheck())
        avChecks.add(CallReturnCheck())
        avChecks.add(AccessControlLogicCheck())
        avChecks.add(ReentrancyCheck())
        avChecks.add(DefaultProxyDelegateCheck())
        avChecks.add(TXOriginCheck())
        avChecks.add(TimeManipulationCheck())
        avChecks.add(LocalWriteToStorageCheck())
        avChecks.add(BadRandomnessCheck())
        avChecks.add(OverUnderflowCheck())
        avChecks.add(DOSCheck())
        avChecks.add(AddressPaddingCheck())
        avChecks.add(FrontRunningCheck())
    }

    fun updateChecks(filename: String) {
        val filenameMappingNormalized =
            "smart-contract-sanctuary-ethereum/contracts/mainnet/" +
                filename.substringAfterLast("/").substring(0, 2).lowercase() +
                "/" +
                filename.substringAfterLast("/")
        checks.addAll(avChecks)
        val checkfile =
            object {}
                .javaClass
                .getResourceAsStream("/contract_checks_verify.json")
                ?.bufferedReader()
                ?.readText()
        checkfile?.let {
            var jsonObject = JSONTokener(checkfile).nextValue() as JSONObject
            if (jsonObject.has(filenameMappingNormalized)) {
                var jsonChecks = jsonObject.getJSONArray(filenameMappingNormalized)
                jsonChecks?.let {
                    optInChecks = ""
                    for (i in 0 until jsonChecks.length()) {
                        optInChecks = optInChecks + jsonChecks[i] + ","
                    }
                    optInChecks = optInChecks.trim(',')
                }
            }
            if (optInChecks.isNotEmpty()) {
                val avChecks = checks.toList()
                checks.clear()
                val checkstrings = optInChecks.split(",").map { it.trim() }
                for (check in checkstrings) {
                    val checkclass =
                        avChecks.filter { it::class.simpleName.equals(check) }.firstOrNull()
                    if (checkclass != null) {
                        checks.add(checkclass)
                    } else {
                        log.error("Check wit name $check does not exist.")
                    }
                }
            }
        }
    }

    fun persistGraph(translationResult: TranslationResult) {
        val bench = Benchmark(this.javaClass, "Push cpg to neo4j", false, translationResult)
        log.info("Using import depth: $depth")
        log.info(
            "Count base nodes to save: " +
                translationResult.components.size +
                translationResult.additionalNodes.size
        )

        val sessionAndSessionFactoryPair = connect()

        val session = sessionAndSessionFactoryPair.first

        session.beginTransaction().use { transaction ->
            if (!noPurgeDb) session.purgeDatabase()
            session.save(translationResult.components, depth)
            session.save(translationResult.additionalNodes, depth)
            transaction.commit()
        }

        session.clear()
        sessionAndSessionFactoryPair.second.close()
        bench.addMeasurement()
    }

    /**
     * Connects to the neo4j db.
     *
     * @return a Pair of Optionals of the Session and the SessionFactory, if it is possible to
     *   connect to neo4j. If it is not possible, the return value is a Pair of empty Optionals.
     * @throws InterruptedException, if the thread is interrupted while it try´s to connect to the
     *   neo4j db.
     * @throws ConnectException, if there is no connection to bolt://localhost:7687 possible
     */
    @Throws(InterruptedException::class, ConnectException::class)
    fun connect(): Pair<Session, SessionFactory> {
        var fails = 0
        var sessionFactory: SessionFactory? = null
        var session: Session? = null
        while (session == null && fails < MAX_COUNT_OF_FAILS) {
            try {
                val configuration =
                    Configuration.Builder()
                        .uri("$PROTOCOL$host:$port")
                        .autoIndex(AUTO_INDEX)
                        .credentials(neo4jUsername, neo4jPassword)
                        .verifyConnection(VERIFY_CONNECTION)
                        .build()
                sessionFactory =
                    SessionFactory(
                        configuration,
                        "de.fraunhofer.aisec.cpg.graph",
                        "de.fraunhofer.aisec.cpg.frontends"
                    )
                sessionFactory.register(AstChildrenEventListener())

                session = sessionFactory.openSession()
            } catch (ex: ConnectionException) {
                sessionFactory = null
                fails++
                log.error(
                    "Unable to connect to localhost:7687, " +
                        "ensure the database is running and that " +
                        "there is a working network connection to it."
                )
                Thread.sleep(TIME_BETWEEN_CONNECTION_TRIES)
            } catch (ex: AuthenticationException) {
                log.error("Unable to connect to localhost:7687, wrong username/password!")
                exitProcess(EXIT_FAILURE)
            }
        }
        if (session == null || sessionFactory == null) {
            log.error("Unable to connect to localhost:7687")
            exitProcess(EXIT_FAILURE)
        }
        assert(fails <= MAX_COUNT_OF_FAILS)
        return Pair(session, sessionFactory)
    }

    fun runVulnerabilityChecks(filename: String) {
        val printedFiles = mutableListOf<String>()
        GraphDatabase.driver("bolt://localhost:7687", AuthTokens.basic("neo4j", neo4jPassword))
            .use { driver ->
                driver.session().use { session ->
                    session.readTransaction() { t: Transaction ->
                        for (check in checks) {
                            var foundFinding = false
                            val duration = measureTimeMillis {
                                var checkFindings = check.check(t)
                                if (checkFindings.isNotEmpty()) {
                                    if (findings[filename] == null) {
                                        findings.put(filename, mutableListOf())
                                    }
                                    checkFindings.forEach {
                                        val finding =
                                            check.getVulnerabilityName() +
                                                ", " +
                                                it.artifactLocation
                                                    .toString()
                                                    .substringAfter("file:") +
                                                " " +
                                                it.region.toString()
                                        foundFinding = true
                                        if (PRINT_ON_FIND) {
                                            if (!printedFiles.contains(filename)) {
                                                println("File: " + filename)
                                            }
                                            println("- " + finding)
                                        } else {
                                            findings[filename]!!.add(finding)
                                        }
                                    }
                                }
                            }
                            compDurations[check.javaClass.simpleName] = duration
                            println(check.javaClass.simpleName + " took " + duration + " ms")
                            if (optInChecks.isNotEmpty() && foundFinding) {
                                println("Verified: " + check::class.simpleName)
                            }
                        }
                    }
                }
            }
    }
}

class AstChildrenEventListener : EventListenerAdapter() {
    private val nodeNameField =
        Node::class
            .memberProperties
            .first() { it.name == "name" }
            .javaField
            .also { it?.isAccessible = true }

    override fun onPreSave(event: Event?) {
        val node = event?.`object` as? Node ?: return
        node.astChildren = SubgraphWalker.getAstChildren(node)
        if (node is CallExpression) fixBackingFields(node)
    }

    private fun fixBackingFields(node: CallExpression) {
        // CallExpression overwrites name property and must be copied to JvmField
        // to be visible by Neo4jOGM
        nodeNameField?.set(node, node.name)
    }
}

/** Starts a command line application of the cpg-solidity tool. */
fun main(args: Array<String>) {
    val exitCode = CommandLine(App()).execute(*args)
    exitProcess(exitCode)
}

val TranslationResult.additionalNodes: MutableList<Node>
    get() =
        this.scratch.computeIfAbsent("additionalNodes") { mutableListOf<Node>() }
            as MutableList<Node>

operator fun TranslationResult.plusAssign(node: Node) {
    if (!this.additionalNodes.contains(node)) this.additionalNodes += node
}
