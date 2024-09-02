# CPG Contract Checker (CCC)
This project aims to identify known smart contract vulnerabilities in code snippets as well as compilable contracts in 
the Ethereum Smart Contract ecosystem.
The analysis is performed on a semantic CPG of source code, which makes this tool especially fit to identify coding
issues in the early development cycle. The main purpose of this repository is to allow replication of a scientific
study on smart contracts and enable practitioners to analyze their predeployed smart contracts.

## What is this?

This project is composed of `cpg-solidity` a frontend for the Solidity language to the CPG library, and the `cpg-contract-checker-app` 
an interface to the analysis component that can run a collection of checks in the form of [Cypher graph queries](https://neo4j.com/docs/cypher-manual/current/introduction/cypher-overview/).

`cpg-solidity` extends the [CPG library](https://github.com/Fraunhofer-AISEC/cpg), a representation of source code in the form of a labeled directed multi-graph that
represents program syntax, execution order, and data flows. We use pre-existing nodes to represent program structures that
are common across multiple languages and implement our own nodes to model solidity-specific program behavior. The frontend parses the
source files with a modified [ANTLR](https://www.antlr.org/) grammar. The grammar was modified to allow translation of 
fragmented source code on any hierarchy level and can be found under `cpg-solidity/.../antlr/Solidity.g4`.
After translating the parsed ANTLR AST into our modified CPG for Solidity, we supplement the pre-existing passes of the CPG library
with our own passes and pass extensions to adapt the general representation of program behavior (execution order and data flow)
to the execution of Ethereum smart contract.

The `cpg-contract-checker-app` is the interface to the analysis, parameterization and configuration. It starts the translation of
the parsed ANTLR structures to a program behavior representing CPG with `cpg-solidity`, persists the resulting graph to a 
[Neo4j](https://neo4j.com/) graph database and identifies vulnerability patterns in the analyzed code by running a set of Cypher queries against
the Neo4j database. The checks are located under `src/.../checks` and execute the queries that can be found under `\resources`.

## Usage

Here, we will guide you through the setup to run CCC.

### Requirements
To run CCC you need the following:
* git
* Java 17 (OpenSDK)
* Neo4j:5.3 with APOC

Install Neo4j on your machine or in a docker container:
```
docker run -d --env NEO4J_AUTH=neo4j/password -p7474:7474 -p7687:7687 -e NEO4J_apoc_export_file_enabled=true \            
    -e NEO4J_apoc_import_file_enabled=true \
    -e NEO4J_apoc_import_file_use__neo4j__config=true \
    -e NEO4JLABS_PLUGINS=\[\"apoc\"\] \
    neo4j:5.3
```

### Build
Build the project with gradle:
```
./gradlew clean installDist
```
or build a docker container with integrated Neo4j installation:
```
docker build -t aisec/ccc . -f neo4j-v5.Dockerfile
```

### Run
To run the checks for a specific file run:
```
./cpg-contract-checker-app/build/install/cpg-contract-checker-app/bin/cpg-contract-checker-app <<<Contractfile.sol>>>
```
If you want to run only a subset of the available checks, specify them via parameter, e.g.:
```
.../cpg-contract-checker-app -vc CallReturnCheck,ReentrancyCheck <<<Contractfile.sol>>>
```
When analyzing a batch of files with different sets of checks per file, you can define them in a JSON file and store them
in the CCC resource folder before building. The format of the JSON file is:
```
{
    "<Contractfile.sol>":["<Checkname1>,<Checkname2>,..."],
    ...
}
```
The files that have to be analyzed should still be specified over the additional parameter.


## Vulnerability Checks
The following Checks are available to the user and map to the 10 [DASP categories](https://dasp.co/):

| Query                           | Check                          | DASP Category             |
|---------------------------------|--------------------------------|---------------------------|
| Reentrancy                      | ReentrancyCheck                | Reentrancy                |
| AccessControlLogic              | AccessControlLogicCheck        | Access Control            |
| AccessControlSelfdestruct       | AccessControlSelfdestructCheck | *                         |
| DefaultProxyDelegate            | DefaultProxyDelegateCheck      | *                         |
| TXOrigin                        | TXOriginCheck                  | *                         |
| OverUnderflow                   | OverUnderflowCheck             | Arithmetic                |
| CallReturn                      | CallReturnCheck                | Unchecked Low Level Calls |
| DOSThroughExhaustion            | DOSCheck                       | Denial of Service         |
| CallBlocksStateChangesOrCalls   | *                              | *                         |
| CallBlocksFutureCall            | *                              | *                         |
| EmptyCollectionUsedForTransfers | *                              | *                         |
| BadRandomness                   | BadRandomnessCheck             | Bad Randomness            |
| FrontRunning                    | FrontRunningCheck              | Front Running             |
| TimeManipulation                | TimeManipulationCheck          | Time Manipulation         |
| AddressPaddingStateChange       | AddressPaddingCheck            | Short Addresses           |
| AddressPaddingAtCall            | *                              | *                         |
| LocalWriteToStorage             | LocalWriteToStorageCheck       | Unknown Unknowns          |

## Development
To extend CCC, fork the repository and implement your own CPG Nodes/Edges and CCC Checks.

### Code Style

We use [Google Java Style](https://github.com/google/google-java-format) as a formatting. Please install the appropriate plugin for your IDE, such as the [google-java-format IntelliJ plugin](https://plugins.jetbrains.com/plugin/8527-google-java-format) or [google-java-format Eclipse plugin](https://github.com/google/google-java-format/releases/download/google-java-format-1.6/google-java-format-eclipse-plugin_1.6.0.jar).

### Integration into IntelliJ

Straightforward, however three things are recommended

* Enable gradle "auto-import"
* Enable google-java-format
* Hook gradle spotlessApply into "before build" (might be obsolete with IDEA 2019.1)

## Contributing

If you want to contribute, look at our current policy on contributions in `CONTRIBUTING.md`.

## Study

This tool was used as one of the essential components to realize a study on the prevalence of vulnerabilities in code
snippets and smart contracts that we consider to have included them based on a similarity metric. A preprint of the paper
can be found [here]().

We evaluated our tool and compared it against other smart contract vulnerability detection tools. To do this, we integrated
our tool into the [SmartBugs Benchmark](https://github.com/smartbugs/smartbugs) the current integration can be found [here](https://github.com/fwendland/smartbugs/commit/85529da87adf98cc01773af2da3fe70634eeabb6) and is planned to be merged with
the main project.

The description of how to run our study pipeline, the necessary evaluation scripts, the used data sets, as well
as intermediate results are available at [Zenodo]().

## References

Reference to paper once published.



