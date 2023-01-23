1) Fund contract
       Deployment
         Should set the right owner:
     TypeError: Cannot read properties of undefined (reading 'ethUsdPriceFeedAddress')
      at deployFundFixture (test/test.js:13:67)
      at processTicksAndRejections (node:internal/process/task_queues:95:5)
      at loadFixture (node_modules/@nomicfoundation/hardhat-network-helpers/src/loadFixture.ts:59:18)
      at Context.<anonymous> (test/test.js:21:37)

  2) Fund contract
       Deployment
         Fund should be more than or equal to 0.01 ethers:
     TypeError: Cannot read properties of undefined (reading 'ethUsdPriceFeedAddress')
      at deployFundFixture (test/test.js:13:67)
      at processTicksAndRejections (node:internal/process/task_queues:95:5)
      at loadFixture (node_modules/@nomicfoundation/hardhat-network-helpers/src/loadFixture.ts:59:18)
      at Context.<anonymous> (test/test.js:25:30)

  3) Fund contract
       Withdrawal
         Only owner can withdraw funds:
     TypeError: Cannot read properties of undefined (reading 'ethUsdPriceFeedAddress')
      at deployFundFixture (test/test.js:13:67)
      at processTicksAndRejections (node:internal/process/task_queues:95:5)
      at loadFixture (node_modules/@nomicfoundation/hardhat-network-helpers/src/loadFixture.ts:59:18)
      at Context.<anonymous> (test/test.js:35:40)

  4) Fund contract
       Event check
         Emitting event correctly:
     TypeError: Cannot read properties of undefined (reading 'ethUsdPriceFeedAddress')
      at deployFundFixture (test/test.js:13:67)
      at processTicksAndRejections (node:internal/process/task_queues:95:5)
      at loadFixture (node_modules/@nomicfoundation/hardhat-network-helpers/src/loadFixture.ts:59:18)
      at Context.<anonymous> (test/test.js:42:30)
