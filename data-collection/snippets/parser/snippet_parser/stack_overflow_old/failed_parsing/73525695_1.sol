1) Balancer Pool S.Contract
       Balancer Pool Adds Liquidity:
     Error: VM Exception while processing transaction: reverted with reason string 'BAL#401'
      at <UnrecognizedContract>.<unknown> (0xba12222222228d8ba445958a75a0704d566bf2c8)
      at BalancerOperator.addLiquidity (contracts/swaps/Balancer/BalancerOperator.sol:39)
      at async HardhatNode._mineBlockWithPendingTxs (node_modules\hardhat\src\internal\hardhat-network\provider\node.ts:1773:23)
      at async HardhatNode.mineBlock (node_modules\hardhat\src\internal\hardhat-network\provider\node.ts:466:16)
      at async EthModule._sendTransactionAndReturnHash (node_modules\hardhat\src\internal\hardhat-network\provider\modules\eth.ts:1504:18)
      at async HardhatNetworkProvider.request (node_modules\hardhat\src\internal\hardhat-network\provider\provider.ts:118:18)
      at async EthersProviderWrapper.send (node_modules\@nomiclabs\hardhat-ethers\src\internal\ethers-provider-wrapper.ts:13:20)

  2) Balancer Pool S.Contract
       Balancer Pool Removes Liquidity:
     Error: VM Exception while processing transaction: reverted with reason string 'BAL#401'
      at <UnrecognizedContract>.<unknown> (0xba12222222228d8ba445958a75a0704d566bf2c8)
      at BalancerOperator.removeLiquidity (contracts/swaps/Balancer/BalancerOperator.sol:54)
      at async HardhatNode._mineBlockWithPendingTxs (node_modules\hardhat\src\internal\hardhat-network\provider\node.ts:1773:23)
      at async HardhatNode.mineBlock (node_modules\hardhat\src\internal\hardhat-network\provider\node.ts:466:16)
      at async EthModule._sendTransactionAndReturnHash (node_modules\hardhat\src\internal\hardhat-network\provider\modules\eth.ts:1504:18)
      at async HardhatNetworkProvider.request (node_modules\hardhat\src\internal\hardhat-network\provider\provider.ts:118:18)
      at async EthersProviderWrapper.send (node_modules\@nomiclabs\hardhat-ethers\src\internal\ethers-provider-wrapper.ts:13:20)

  3) Balancer Pool S.Contract
       Balancer Pool Exchanges Tokens:
     Error: VM Exception while processing transaction: reverted with reason string 'BAL#401'
      at <UnrecognizedContract>.<unknown> (0xba12222222228d8ba445958a75a0704d566bf2c8)
      at BalancerOperator.exchangeTokens (contracts/swaps/Balancer/BalancerOperator.sol:83)
      at async HardhatNode._mineBlockWithPendingTxs (node_modules\hardhat\src\internal\hardhat-network\provider\node.ts:1773:23)
      at async HardhatNode.mineBlock (node_modules\hardhat\src\internal\hardhat-network\provider\node.ts:466:16)
      at async EthModule._sendTransactionAndReturnHash (node_modules\hardhat\src\internal\hardhat-network\provider\modules\eth.ts:1504:18)
      at async HardhatNetworkProvider.request (node_modules\hardhat\src\internal\hardhat-network\provider\provider.ts:118:18)
      at async EthersProviderWrapper.send (node_modules\@nomiclabs\hardhat-ethers\src\internal\ethers-provider-wrapper.ts:13:20)
