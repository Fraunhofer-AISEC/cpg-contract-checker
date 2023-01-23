pragma solidity ^0.6.0;

import "https://raw.githubusercontent.com/smartcontractkit/chainlink/develop/evm-contracts/src/v0.6/ChainlinkClient.sol";

contract APIConsumer is ChainlinkClient {
  
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
        
        
        
        request.add("path", "Name");
        
        
       
        
        
        return sendChainlinkRequestTo(oracle, request, fee);
    }
    
     
    function fulfill(bytes32 _requestId, string memory _name) public recordChainlinkFulfillment(_requestId)
    {
        Name = _name;
    }
}
