pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract Token is ChainlinkClient {
    using Chainlink for Chainlink.Request;
    
    string public volume;
    
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;

    string public name = "Test token";
    string public symbol = "CEAI";
    

    uint256 public totalSupply = 1000000;

    
    address public owner;

    
    mapping(address => uint256) balances;

    constructor() {
        setPublicChainlinkToken();
        oracle = 0x7AFe1118Ea78C1eae84ca8feE5C65Bc76CcF879e;
        jobId = "6d1bfe27e7034b1d87b5270556b17277";
        fee = 0.1 * 10 ** 18; 
        
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    
    function transfer(address to, uint256 amount) external {
        
        require(balances[msg.sender] >= amount, "Not enough tokens");

        balances[msg.sender] -= amount;
        balances[to] += amount;
    
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        
        
        request.add("get", "https://en6d2u28sb3n1b4.m.pipedream.net/?test=2");
        request.add("path", "workflow_id");
        
        
        sendChainlinkRequestTo(oracle, request, fee);
    }

    
    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
    
    function fulfill(bytes32 _requestId, string memory _volume) public recordChainlinkFulfillment(_requestId)
    {
        volume = _volume;
    }
}
