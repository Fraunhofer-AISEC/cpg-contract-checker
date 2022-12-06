node deploy.js
Compiling the contract
assert.js:350
    throw err;
    ^

AssertionError [ERR_ASSERTION]: Invalid callback object specified.
    at runWithCallbacks (C:\COMP_DEV\blockchain\module_5\node_modules\solc\wrapper.js:97:7)
    at compileStandard (C:\COMP_DEV\blockchain\module_5\node_modules\solc\wrapper.js:207:14)
    at Object.compileStandardWrapper [as compile] (C:\COMP_DEV\blockchain\module_5\node_modules\solc\wrapper.js:214:14)
    at compileContract (C:\COMP_DEV\blockchain\module_5\deploy.js:24:33)
    at Object.<anonymous> (C:\COMP_DEV\blockchain\module_5\deploy.js:5:16)
    at Module._compile (internal/modules/cjs/loader.js:688:30)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:699:10)
    at Module.load (internal/modules/cjs/loader.js:598:32)
    at tryModuleLoad (internal/modules/cjs/loader.js:537:12)
    at Function.Module._load (internal/modules/cjs/loader.js:529:3)
    at Function.Module.runMain (internal/modules/cjs/loader.js:741:12)
    at startup (internal/bootstrap/node.js:285:19)
    at bootstrapNodeJSCore (internal/bootstrap/node.js:739:3)
