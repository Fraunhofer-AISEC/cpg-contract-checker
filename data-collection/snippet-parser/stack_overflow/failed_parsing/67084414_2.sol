sohampadia@localhost inbox]$ node deploy.js   
/home/sohampadia/solidityprojs/inbox/compile.js:25  
  const compiledInboxContract = compiledObj.contracts['Inbox.sol']['Inbox']                                                          
                                                     ^  

TypeError: Cannot read property 'Inbox.sol' of undefined  
    at Object.<anonymous> (/home/sohampadia/solidityprojs/inbox/compile.js:25:54)  
    at Module._compile (internal/modules/cjs/loader.js:1063:30)  
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:1092:10)  
    at Module.load (internal/modules/cjs/loader.js:928:32)  
    at Function.Module._load (internal/modules/cjs/loader.js:769:14)  
    at Module.require (internal/modules/cjs/loader.js:952:19)  
    at require (internal/modules/cjs/helpers.js:88:18)  
    at Object.<anonymous> (/home/sohampadia/solidityprojs/inbox/deploy.js:3:33)  
    at Module._compile (internal/modules/cjs/loader.js:1063:30)  
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:1092:10)  
    at Module.load (internal/modules/cjs/loader.js:928:32)  
    at Function.Module._load (internal/modules/cjs/loader.js:769:14)  
    at Function.executeUserEntryPoint [as runMain] (internal/modules/run_main.js:72:12)  
    at internal/main/run_main_module.js:17:47  
