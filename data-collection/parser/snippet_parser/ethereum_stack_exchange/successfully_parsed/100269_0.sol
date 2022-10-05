pragma solidity ^0.6.0;

import "https://raw.githubusercontent.com/smartcontractkit/chainlink/develop/evm-contracts/src/v0.6/ChainlinkClient.sol";



contract ChainlinkExample is ChainlinkClient {
  
    uint256 public price;
    
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    constructor() public {
        setPublicChainlinkToken();
        oracle = 0x2f90A6D021db21e1B2A077c5a37B3C7E75D15b7e;
        jobId = "29fa9aa13bf1468788b7cc4a500a45b8";
        fee = 0.1 * 10 ** 18; 
    }

    function requestEthereumPrice() public returns (bytes32 requestId){
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
            req.add("get", "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD");
            req.add("path", "USD");
            req.addInt("times", 100);
        return sendChainlinkRequestTo(oracle, request, fee);
    }

    function fulfill(bytes32 _requestId, uint256 _price) public recordChainlinkFulfillment(_requestId){
        price = _price;
    }

}
