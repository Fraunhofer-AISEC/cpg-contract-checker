

pragma solidity >=0.7.0 <0.9.0;
import "https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.8/ChainlinkClient.sol";

contract Fiat is ChainlinkClient {
    
    using Chainlink for Chainlink.Request;

    uint256 public price;
    
    bytes32 private jobId;
    uint256 private fee;
    
    constructor() {
        setPublicChainlinkToken();
        jobId = "83ba9ddc927946198fbd0bf1bd8a8c25";
        fee = 0.1 * 10 ** 18; 
    }
    
    
    function findExhangeRateFiatToBaseFiat(string memory _url
     , address _oracle) public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        
        
        
        request.add("get", _url);
        
        string[] memory path = new string[](2);
        path[0] = "Realtime Currency Exchange Rate";
        path[1] = "5. Exchange Rate";
        request.addStringArray("path", path);
        
        
        request.addInt("times", 10000000000);
        
        
        return sendChainlinkRequestTo(_oracle, request, fee);
    }
    
     
    function fulfill(bytes32 _requestId, uint256 _price) public recordChainlinkFulfillment(_requestId)
    {
        price = _price;
    }

}
