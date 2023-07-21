Compile subgraphERROR TS2339: Property 'src' does not exist on type '~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String,~lib/@graphprotocol/graph-ts/common/value/Value>'.

   entity.src = event.params.src
          ~~~
 in src/contract.ts(42,10)

ERROR TS2339: Property 'dst' does not exist on type '~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String,~lib/@graphprotocol/graph-ts/common/value/Value>'.

   entity.dst = event.params.dst
          ~~~
 in src/contract.ts(43,10)

ERROR TS2339: Property 'wad' does not exist on type '~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String,~lib/@graphprotocol/graph-ts/common/value/Value>'.

   entity.wad = event.params.wad
          ~~~
 in src/contract.ts(44,10)

✖ Failed to compile subgraph: Failed to compile data source mapping: 3 compile error(s)
Error: Failed to compile data source mapping: 3 compile error(s)
    at Compiler._compileDataSourceMapping (/home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/@graphprotocol/graph-cli/dist/compiler/index.js:297:19)
    at /home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/@graphprotocol/graph-cli/dist/compiler/index.js:201:167
    at updateInDeeply (/home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/immutable/dist/immutable.js:2121:22)
    at updateInDeeply (/home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/immutable/dist/immutable.js:2134:23)
    at updateInDeeply (/home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/immutable/dist/immutable.js:2134:23)
    at updateIn$1 (/home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/immutable/dist/immutable.js:2099:24)
    at Map.updateIn (/home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/immutable/dist/immutable.js:2180:12)
    at /home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/@graphprotocol/graph-cli/dist/compiler/index.js:201:115
    at /home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/immutable/dist/immutable.js:3321:30
    at List.withMutations (/home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/immutable/dist/immutable.js:2367:5)
Error: EEXIT: 1
    at Object.exit (/home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/@oclif/core/lib/errors/index.js:21:11)
    at BuildCommand.exit (/home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/@oclif/core/lib/command.js:131:23)
    at BuildCommand.run (/home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/@graphprotocol/graph-cli/dist/commands/build.js:76:22)
    at async BuildCommand._run (/home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/@oclif/core/lib/command.js:117:22)
    at async Config.runCommand (/home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/@oclif/core/lib/config/config.js:329:25)
    at async Object.run (/home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/@oclif/core/lib/main.js:89:16)
Error: The AssemblyScript compiler crashed when compiling this file: 'src/contract.ts'
Suggestion: try to comment the whole file and uncomment it little by little while re-running the graph-cli until you isolate the line where the problem happens.
Also, please contact us so we can make the CLI better by handling errors like this. You can reach out in any of these links:
- Discord channel: https:
- Github issues: https:
    at process.<anonymous> (/home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/@graphprotocol/graph-cli/dist/compiler/asc.js:29:11)
    at process.emit (node:events:525:35)
    at processEmit [as emit] (/home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/signal-exit/index.js:191:37)
    at process.exit (node:internal/process/per_thread:190:15)
    at Object.handle (/home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/@oclif/core/lib/errors/handle.js:33:21)
    at module.exports (/home/rishabh/Documents/freelancing/tax-chain-client-demo/subgraph/taxchain-govt/node_modules/@oclif/core/handle.js:1:58)
