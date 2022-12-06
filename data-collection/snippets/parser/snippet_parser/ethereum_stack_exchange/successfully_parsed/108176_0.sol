pragma solidity ^0.6.0;

import "@chainlink/contracts/src/v0.6/ChainlinkClient.sol";



contract ChainlinkExample is ChainlinkClient  {
    using Chainlink for Chainlink.Request;
  
  uint256 public currentPrice;
  address public owner;
  
    
  address ORACLE_ADDRESS = 0xe0090e7AB96123FDE1D3CC8b3f3b342B4aA60a2E;
  
  
  string constant JOBID = "390abeb54c8b4bd0ae079699ba883bf2";
  
  
  
  uint256 constant private ORACLE_PAYMENT = 100000000000000000;

  constructor() public {
    
    setPublicChainlinkToken();
    owner = msg.sender;
  }

  
  
  function requestEthereumPrice() 
    public
    onlyOwner
  {
    
    Chainlink.Request memory req = buildChainlinkRequest(stringToBytes32(JOBID), address(this), this.fulfill.selector);
    
    req.add("get", "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD");
    
    req.add("path", "USD");
    
    req.addInt("times", 100);
    
    sendChainlinkRequestTo(ORACLE_ADDRESS, req, ORACLE_PAYMENT);
  }

  
  function fulfill(bytes32 _requestId, uint256 _price)
    public
    
    recordChainlinkFulfillment(_requestId)
  {
    currentPrice = _price;
  }
  
  
  function cancelRequest(
    bytes32 _requestId,
    uint256 _payment,
    bytes4 _callbackFunctionId,
    uint256 _expiration
  )
    public
    onlyOwner
  {
    cancelChainlinkRequest(_requestId, _payment, _callbackFunctionId, _expiration);
  }

  
  
  function withdrawLink()
    public
    onlyOwner
  {
    LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
    require(link.transfer(msg.sender, link.balanceOf(address(this))), "Unable to transfer");
  }
  
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
  
   
  function stringToBytes32(string memory source) private pure returns (bytes32 result) {
    bytes memory tempEmptyStringTest = bytes(source);
    if (tempEmptyStringTest.length == 0) {
      return 0x0;
    }
    assembly { 
      result := mload(add(source, 32))
    }
  }
}
