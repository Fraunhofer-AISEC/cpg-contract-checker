pragma solidity ^0.6.0;

import "@chainlink/contracts/src/v0.6/ChainlinkClient.sol";

contract test is ChainlinkClient {
  
    string public Name;
    
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    
    constructor() public {
        setPublicChainlinkToken();
        oracle = 0x2f90A6D021db21e1B2A077c5a37B3C7E75D15b7e;
        jobId = "50fc4215f89443d185b061e5d7af9490";
        fee = 0.1 * 10 ** 18; 
    }
    
    
    function requestAthleteData() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        
        
        request.add("get", "https://1e68b62e-578e-4390-bf43-6b70a92a23b6.mock.pstmn.io/get");
        
        
        
        request.add("path", "0.Name");
        
        
       
        
        
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
     
    function fulfill(bytes32 _requestId, bytes32  _name) public recordChainlinkFulfillment(_requestId)
    {
       string memory stringName = bytes32ToString(_name);
        Name = stringName;
    }
}
