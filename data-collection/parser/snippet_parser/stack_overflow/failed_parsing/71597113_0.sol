   Should create and execute market sales:
     Error: VM Exception while processing transaction: reverted with reason string 'ERC1155: caller is not owner nor approved'
    at NFT1155.balanceOf (@openzeppelin/contracts/token/ERC1155/ERC1155.sol:71)
    at NFT1155.isApprovedForAll (@openzeppelin/contracts/token/ERC1155/ERC1155.sol:110)
    at NFT1155.createMarketSale (contracts/NFT1155.sol:165)
    at async HardhatNode._mineBlockWithPendingTxs (node_modules/hardhat/src/internal/hardhat-network/provider/node.ts:1772:23)
    at async HardhatNode.mineBlock (node_modules/hardhat/src/internal/hardhat-network/provider/node.ts:466:16)
    at async EthModule._sendTransactionAndReturnHash (node_modules/hardhat/src/internal/hardhat-network/provider/modules/eth.ts:1496:18)
    at async HardhatNetworkProvider.request (node_modules/hardhat/src/internal/hardhat-network/provider/provider.ts:118:18)
    at async EthersProviderWrapper.send (node_modules/@nomiclabs/hardhat-ethers/src/internal/ethers-provider-wrapper.ts:13:20)
