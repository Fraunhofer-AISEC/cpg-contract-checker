Error: VM Exception while processing transaction: reverted with reason string 'multi call failed'
    at RoleMultiCall.multiCall (contracts/optional/RoleMultiCall.sol:21)
    at async HardhatNode._mineBlockWithPendingTxs (/Users/azlan/projects/hardhats/dao-mix/node_modules/hardhat/src/internal/hardhat-network/provider/node.ts:1772:23)
    at async HardhatNode.mineBlock (/Users/azlan/projects/hardhats/dao-mix/node_modules/hardhat/src/internal/hardhat-network/provider/node.ts:466:16)
    at async EthModule._sendTransactionAndReturnHash (/Users/azlan/projects/hardhats/dao-mix/node_modules/hardhat/src/internal/hardhat-network/provider/modules/eth.ts:1496:18)
    at async HardhatNetworkProvider.request (/Users/azlan/projects/hardhats/dao-mix/node_modules/hardhat/src/internal/hardhat-network/provider/provider.ts:118:18)
    at async EthersProviderWrapper.send (/Users/azlan/projects/hardhats/dao-mix/node_modules/@nomiclabs/hardhat-ethers/src/internal/ethers-provider-wrapper.ts:13:20)
