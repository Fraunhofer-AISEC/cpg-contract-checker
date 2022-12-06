

  Factory
    1) Should not throw error


  0 passing (2s)
  1 failing

  1) Factory
       Should not throw error:
     Error: Transaction reverted: function call to a non-contract account
      at Factory.newToken (contracts/Factory.sol:13)
      at processTicksAndRejections (internal/process/task_queues.js:97:5)
      at HardhatNode._mineBlockWithPendingTxs (node_modules/hardhat/src/internal/hardhat-network/provider/node.ts:1070:23)
      at HardhatNode.mineBlock (node_modules/hardhat/src/internal/hardhat-network/provider/node.ts:369:16)
      at EthModule._sendTransactionAndReturnHash (node_modules/hardhat/src/internal/hardhat-network/provider/modules/eth.ts:1373:18)
      at HardhatNetworkProvider.request (node_modules/hardhat/src/internal/hardhat-network/provider/provider.ts:99:18)
      at EthersProviderWrapper.send (node_modules/@nomiclabs/hardhat-ethers/src/internal/ethers-provider-wrapper.ts:13:20)

