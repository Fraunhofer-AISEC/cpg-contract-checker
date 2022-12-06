`const { interface, bytecode } = require('../compile');
        ^
TypeError: Cannot destructure property 'interface' of 'require(...)' as it is undefined.
    at Object.<anonymous> (C:\Users\91960\lottery\test\Lottery.test.js:6:9)
    at Module._compile (node:internal/modules/cjs/loader:1101:14)
    at Object.Module._extensions..js (node:internal/modules/cjs/loader:1153:10)
    at Module.load (node:internal/modules/cjs/loader:981:32)
    at Function.Module._load (node:internal/modules/cjs/loader:822:12)
    at Module.require (node:internal/modules/cjs/loader:1005:19)
    at require (node:internal/modules/cjs/helpers:102:18)
    at C:\Users\91960\lottery\node_modules\mocha\lib\mocha.js:334:36
    at Array.forEach (<anonymous>)
    at Mocha.loadFiles (C:\Users\91960\lottery\node_modules\mocha\lib\mocha.js:331:14)
    at Mocha.run (C:\Users\91960\lottery\node_modules\mocha\lib\mocha.js:809:10)
    at Object.exports.singleRun (C:\Users\91960\lottery\node_modules\mocha\lib\cli\run-helpers.js:108:16)
    at exports.runMocha (C:\Users\91960\lottery\node_modules\mocha\lib\cli\run-helpers.js:142:13)
    at Object.exports.handler (C:\Users\91960\lottery\node_modules\mocha\lib\cli\run.js:292:3)
    at Object.runCommand (C:\Users\91960\lottery\node_modules\mocha\node_modules\yargs\lib\command.js:242:26)
    at Object.parseArgs [as _parseArgs] (C:\Users\91960\lottery\node_modules\mocha\node_modules\yargs\yargs.js:1113:24)
    at Object.parse (C:\Users\91960\lottery\node_modules\mocha\node_modules\yargs\yargs.js:575:25)
    at Object.exports.main (C:\Users\91960\lottery\node_modules\mocha\lib\cli\cli.js:68:6)
    at Object.<anonymous> (C:\Users\91960\lottery\node_modules\mocha\bin\mocha:162:29)
    at Module._compile (node:internal/modules/cjs/loader:1101:14)
    at Object.Module._extensions..js (node:internal/modules/cjs/loader:1153:10)
    at Module.load (node:internal/modules/cjs/loader:981:32)
    at Function.Module._load (node:internal/modules/cjs/loader:822:12)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:81:12)
    at node:internal/main/run_main_module:17:47 `
