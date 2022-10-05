    eth_estimateGas
  Contract call:       NFTMarket#resellToken
  From:                0x1cbd3b2770909d4e10f157cabc84c7264073c9ec
  To:                  0x5fbdb2315678afecb367f032d93f642f64180aa3
  Value:               0.025 ETH

  Error: VM Exception while processing transaction: reverted with reason string 'ERC721: transfer caller is not owner nor approved'
      at NFT.transferFrom (@openzeppelin/contracts/token/ERC721/ERC721.sol:156)
      at NFTMarket.resellToken (contracts/NFTMarket.sol:89)
      at EthModule._estimateGasAction (E:\маркетплейс\polygon-ethereum\node_modules\hardhat\src\internal\hardhat-network\provider\modules\eth.ts:425:7)
      at HardhatNetworkProvider._sendWithLogging (E:\маркетплейс\polygon-ethereum\node_modules\hardhat\src\internal\hardhat-network\provider\provider.ts:139:22)
      at HardhatNetworkProvider.request (E:\маркетплейс\polygon-ethereum\node_modules\hardhat\src\internal\hardhat-network\provider\provider.ts:116:18)
      at JsonRpcHandler._handleRequest (E:\маркетплейс\polygon-ethereum\node_modules\hardhat\src\internal\hardhat-network\jsonrpc\handler.ts:188:20) 
      at JsonRpcHandler._handleSingleRequest (E:\маркетплейс\polygon-ethereum\node_modules\hardhat\src\internal\hardhat-network\jsonrpc\handler.ts:167:17)
      at Server.JsonRpcHandler.handleHttp (E:\маркетплейс\polygon-ethereum\node_modules\hardhat\src\internal\hardhat-network\jsonrpc\handler.ts:52:21)
