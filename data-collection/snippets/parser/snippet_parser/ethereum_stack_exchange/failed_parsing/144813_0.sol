0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266   To:                 
0xe7f1725e7734ce288f8367e1bb143e90bb3f0512

  Error: VM Exception while processing transaction: reverted with
reason string 'You Don't have enough funds to donate'
      at FundMe.fund (contracts/FundMe.sol:61)
      at FundMe.<fallback> (contracts/FundMe.sol:57)
      at processTicksAndRejections (node:internal/process/task_queues:96:5)
      at HardhatNode.runCall (/home/deepak/blockchain-dev/hardhat-fund-me/node_modules/hardhat/src/internal/hardhat-network/provider/node.ts:652:20)
      at EthModule._callAction (/home/deepak/blockchain-dev/hardhat-fund-me/node_modules/hardhat/src/internal/hardhat-network/provider/modules/eth.ts:354:9)
      at HardhatNetworkProvider._sendWithLogging (/home/deepak/blockchain-dev/hardhat-fund-me/node_modules/hardhat/src/internal/hardhat-network/provider/provider.ts:139:22)
      at HardhatNetworkProvider.request (/home/deepak/blockchain-dev/hardhat-fund-me/node_modules/hardhat/src/internal/hardhat-network/provider/provider.ts:116:18)
      at JsonRpcHandler._handleRequest (/home/deepak/blockchain-dev/hardhat-fund-me/node_modules/hardhat/src/internal/hardhat-network/jsonrpc/handler.ts:188:20)
      at JsonRpcHandler._handleSingleRequest (/home/deepak/blockchain-dev/hardhat-fund-me/node_modules/hardhat/src/internal/hardhat-network/jsonrpc/handler.ts:167:17)

eth_blockNumber eth_getBlockByNumber eth_feeHistory
