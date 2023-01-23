npx hardhat test   
No need to generate any newer typings.


  MyERC20Contract
    when I transfer 10 tokens
      1) sould transfer tokens correctly


  0 passing (728ms)
  1 failing

  1) MyERC20Contract
       when I transfer 10 tokens
         sould transfer tokens correctly:
     Error: VM Exception while processing transaction: reverted with reason string 'ERC20: transfer amount exceeds balance'
    at ERC20._transfer (contracts/ERC20.sol:49)
    at ERC20.transfer (contracts/ERC20.sol:25)
    at async HardhatNode._mineBlockWithPendingTxs (node_modules/hardhat/src/internal/hardhat-network/provider/node.ts:1773:23)
    at async HardhatNode.mineBlock (node_modules/hardhat/src/internal/hardhat-network/provider/node.ts:466:16)
    at async EthModule._sendTransactionAndReturnHash (node_modules/hardhat/src/internal/hardhat-network/provider/modules/eth.ts:1504:18)
    at async HardhatNetworkProvider.request (node_modules/hardhat/src/internal/hardhat-network/provider/provider.ts:118:18)
    at async EthersProviderWrapper.send (node_modules/@nomiclabs/hardhat-ethers/src/internal/ethers-provider-wrapper.ts:13:20)
