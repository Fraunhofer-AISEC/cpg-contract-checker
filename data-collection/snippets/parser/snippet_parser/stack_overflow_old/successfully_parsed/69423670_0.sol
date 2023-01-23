
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";


contract GetSalePrice is ChainlinkClient {
    using Chainlink for Chainlink.Request;
  
    
    string  public salePrice;
    
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    
    constructor() {
        setPublicChainlinkToken();
        oracle = 0xc57B33452b4F7BB189bB5AfaE9cc4aBa1f7a4FD8;
        jobId = "7401f318127148a894c00c292e486ffd";
        fee = 0.1 * 10 ** 18; 
    }
    
    
    function requestSalePrice() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        
        
        request.add("get", "https://api.opensea.io/api/v1/events?asset_contract_address=0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D&event_type=successful&format=json&only_opensea=false&token_id=5407");

        request.add("path", "asset_events.0.total_price");
        
        
        return sendChainlinkRequestTo(oracle, request, fee);
    }
    
     
     function bytes32ToString(bytes32 _bytes32) public pure returns (string memory) {
        uint8 i = 0;
        while(i < 32 && _bytes32[i] != 0) {
            i++;
        }
        bytes memory bytesArray = new bytes(i);
        for (i = 0; i < 32 && _bytes32[i] != 0; i++) {
            bytesArray[i] = _bytes32[i];
        }
        return string(bytesArray);
    }
    
     
    function fulfill(bytes32 _requestId, bytes32 _salePrice) public recordChainlinkFulfillment(_requestId)
    {
        salePrice = bytes32ToString(_salePrice);
    }

}
