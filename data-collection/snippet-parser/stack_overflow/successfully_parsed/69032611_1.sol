

pragma solidity ^0.8.6;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

    contract APIConsumer is ChainlinkClient {
        using Chainlink for Chainlink.Request;

    int256 public signedVolume;
    uint256 public unsignedVolume;

    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    address public _link = 0xa36085F69e2889c224210F603D836748e7dC0088;
    bool isSigned;

    constructor(bool _isSigned) {
        if (_link == address(0)) {
            setPublicChainlinkToken();
        } else {
            setChainlinkToken(_link);
        }
        oracle = 0x67C8d1bcD8d836dF80264f79b948a71e9163A9DB;
        jobId = "28863f680d804d8eabeb5a8257c70201";
        fee = 0.1 * 10 ** 18; 
        isSigned=_isSigned;
    }


    function requestVolumeData() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request;
        if (isSigned) {
            request = buildChainlinkRequest(jobId, address(this), this.fulfillSigned.selector);
        } else {
            request = buildChainlinkRequest(jobId, address(this), this.fulfillUnsigned.selector);
        }
    
        
        request.add("get", "https://www.quandl.com/api/v3/datasets/USTREASURY/BILLRATES.json?api_key=[NOT_SHOWN]&start_date=2021-08-24");
    
        string[] memory path = new string[];
        path[0] = "dataset";
        path[1] = "data";
        path[2] = "0";
        path[3] = "1";
        request.addStringArray("path", path);
    
        int timesAmount = 10**5;
        request.addInt("times", timesAmount);
    
        
        return sendChainlinkRequestTo(oracle, request, fee);
    }   


    function fulfillSigned(bytes32 _requestId, int256 _volume) public recordChainlinkFulfillment(_requestId)
    {
        signedVolume = _volume;
    }
    
    function fulfillUnsigned(bytes32 _requestId, uint256 _volume) public recordChainlinkFulfillment(_requestId)
    {
        unsignedVolume = _volume;
    }
}
