  FundMe
    constructor

      1) "before each" hook for "sets the aggregator addresses correctly"


  0 passing (1s)
  1 failing

  1) FundMe
       "before each" hook for "sets the aggregator addresses correctly":
   
   ERROR processing /Users/namnguyen/Workspace/blockchain/smart-contract-programming/hardhat-fund-me/deploy/01-deploy-fund-me.js:
TypeError: Cannot read property 'length' of undefined
    at getFrom (/Users/namnguyen/Workspace/blockchain/smart-contract-programming/hardhat-fund-me/node_modules/hardhat-deploy/src/helpers.ts:1713:14)
    at fetchIfDifferent (/Users/namnguyen/Workspace/blockchain/smart-contract-programming/hardhat-fund-me/node_modules/hardhat-deploy/src/helpers.ts:939:38)
    at processTicksAndRejections (internal/process/task_queues.js:95:5)
    at runNextTicks (internal/process/task_queues.js:64:3)
    at listOnTimeout (internal/timers.js:526:9)
    at processTimers (internal/timers.js:500:7)
    at _deployOne (/Users/namnguyen/Workspace/blockchain/smart-contract-programming/hardhat-fund-me/node_modules/hardhat-deploy/src/helpers.ts:1002:24)
    at Object.module.exports [as func] (/Users/namnguyen/Workspace/blockchain/smart-contract-programming/hardhat-fund-me/deploy/01-deploy-fund-me.js:13:34)
    at DeploymentsManager.executeDeployScripts (/Users/namnguyen/Workspace/blockchain/smart-contract-programming/hardhat-fund-me/node_modules/hardhat-deploy/src/DeploymentsManager.ts:1219:22)
    at DeploymentsManager.runDeploy (/Users/namnguyen/Workspace/blockchain/smart-contract-programming/hardhat-fund-me/node_modules/hardhat-deploy/src/DeploymentsManager.ts:1052:5)
  Error: ERROR processing /Users/namnguyen/Workspace/blockchain/smart-contract-programming/hardhat-fund-me/deploy/01-deploy-fund-me.js:
  TypeError: Cannot read property 'length' of undefined
      at getFrom (node_modules/hardhat-deploy/src/helpers.ts:1713:14)
      at fetchIfDifferent (node_modules/hardhat-deploy/src/helpers.ts:939:38)
      at processTicksAndRejections (internal/process/task_queues.js:95:5)
      at runNextTicks (internal/process/task_queues.js:64:3)
      at listOnTimeout (internal/timers.js:526:9)
      at processTimers (internal/timers.js:500:7)
      at _deployOne (node_modules/hardhat-deploy/src/helpers.ts:1002:24)
      at Object.module.exports [as func] (deploy/01-deploy-fund-me.js:13:34)
      at DeploymentsManager.executeDeployScripts (node_modules/hardhat-deploy/src/DeploymentsManager.ts:1219:22)
      at DeploymentsManager.runDeploy (node_modules/hardhat-deploy/src/DeploymentsManager.ts:1052:5)
      at DeploymentsManager.executeDeployScripts (node_modules/hardhat-deploy/src/DeploymentsManager.ts:1222:19)
      at processTicksAndRejections (internal/process/task_queues.js:95:5)
      at runNextTicks (internal/process/task_queues.js:64:3)
      at listOnTimeout (internal/timers.js:526:9)
      at processTimers (internal/timers.js:500:7)
      at DeploymentsManager.runDeploy (node_modules/hardhat-deploy/src/DeploymentsManager.ts:1052:5)
      at Object.fixture (node_modules/hardhat-deploy/src/DeploymentsManager.ts:315:9)
      at Context.<anonymous> (test/unit/FundMe.test.js:12:9)

