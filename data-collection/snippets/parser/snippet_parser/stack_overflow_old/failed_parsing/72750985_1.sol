TestBirds

BigNumber { value: "10000000000000000000000" }
    1) Should return correct name, URI, owner and beneficiary

  0 passing (788ms)
  1 failing

  1) TestBirds
       Should return correct name, URI, owner and beneficiary:
     Error: VM Exception while processing transaction: reverted with reason string 'Seller: Costs 2500000000 GWei'
      at TestBirds.onlyOwner (@openzeppelin/contracts/access/Ownable.sol:43)
      at TestBirds._purchase (@divergencetech/ethier/contracts/sales/Seller.sol:229)
      at TestBirds._purchase (@divergencetech/ethier/contracts/sales/Seller.sol:216)
      at TestBirds.mintPublic (contracts/TestBirds.sol:85)
      at HardhatNode._mineBlockWithPendingTxs (node_modules/hardhat/src/internal/hardhat-network/provider/node.ts:1650:23)
      at HardhatNode.mineBlock (node_modules/hardhat/src/internal/hardhat-network/provider/node.ts:459:16)
      at EthModule._sendTransactionAndReturnHash (node_modules/hardhat/src/internal/hardhat-network/provider/modules/eth.ts:1496:18)
      at HardhatNetworkProvider.request (node_modules/hardhat/src/internal/hardhat-network/provider/provider.ts:117:18)
      at EthersProviderWrapper.send (node_modules/@nomiclabs/hardhat-ethers/src/internal/ethers-provider-wrapper.ts:13:20)
