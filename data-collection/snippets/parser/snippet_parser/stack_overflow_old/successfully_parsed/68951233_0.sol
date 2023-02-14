

pragma solidity ^0.8.6;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

    contract APIConsumer is ChainlinkClient {


    uint256 public volume;

    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    address public _link = 0xa36085F69e2889c224210F603D836748e7dC0088;

    constructor() {
        if (_link == address(0)) {
            setPublicChainlinkToken();
        } else {
            setChainlinkToken(_link);
        }
        oracle = 0x56dd6586DB0D08c6Ce7B2f2805af28616E082455;
        jobId = "b6602d14e4734c49a5e1ce19d45a4632";
        fee = 0.1 * 10 ** 18; 
    }


    function requestVolumeData() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
    
        
        request.add("get", "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH&tsyms=USD");
    
   
        request.add("path", "RAW.ETH.USD.VOLUME24HOUR");
    
        int timesAmount = 10**18;
        request.addInt("times", timesAmount);
    
        
        return sendChainlinkRequestTo(oracle, request, fee);
    }   


    function fulfill(bytes32 _requestId, uint256 _volume) public recordChainlinkFulfillment(_requestId)
    {
        volume = _volume;
    }
}
