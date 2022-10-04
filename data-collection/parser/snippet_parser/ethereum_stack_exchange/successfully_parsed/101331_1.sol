pragma solidity ^0.5.1;

import "https://raw.githubusercontent.com/smartcontractkit/chainlink/develop/evm-contracts/src/v0.5/ChainlinkClient.sol";



contract CallerPriceRequest{ function CallerFulfill(bytes32 _requestId, uint256 _price) public; }

contract ChainlinkRequestETHPrice is ChainlinkClient {
    
    address public CallerAddress = 0x5592675bf651ED82E30F78D5ebAfb1f7F5D851c7;
    uint256 public price;
    
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    CallerPriceRequest internal Caller;
    
    constructor() public {
        Caller = CallerPriceRequest( CallerAddress );
        setPublicChainlinkToken();
        oracle = 0x2f90A6D021db21e1B2A077c5a37B3C7E75D15b7e;
        jobId = "29fa9aa13bf1468788b7cc4a500a45b8";
        fee = 0.1 * 10 ** 18; 
    }


    function getETHPrice() public returns (bytes32 requestId){
        Chainlink.Request memory req = buildChainlinkRequest(jobId, CallerAddress, Caller.CallerFulfill.selector);
        req.add("get", "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD");
        req.add("path", "USD");
        req.addInt("times", 100);
        return sendChainlinkRequestTo(oracle, req, fee);
    }

}
