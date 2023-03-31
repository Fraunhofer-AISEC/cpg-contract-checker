
pragma solidity ^0.8.7;


import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract APIConsumer is ChainlinkClient {

    using Chainlink for Chainlink.Request;
  
    uint256 public volume;
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    
    constructor() {
        
        setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
        oracle = 0xCC79157eb46F5624204f47AB42b3906cAA40eaB7;
        jobId = "ca98366cc7314957b8c012c72f05aeeb";
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
    
    function withdrawLink() external {
        LinkTokenInterface linkToken = LinkTokenInterface(chainlinkTokenAddress());
        require(linkToken.transfer(msg.sender, linkToken.balanceOf(address(this))), "Unable to transfer");
    }
}


