pragma solidity ^0.4.24;

import "@chainlink/contracts/src/v0.4/ChainlinkClient.sol";



contract ChainlinkExample is ChainlinkClient {
  
  uint256 public currentPrice;
  address public owner;

  constructor() public {
    
    setPublicChainlinkToken();
    owner = msg.sender;
  }

  
  function requestEthereumPrice(address _oracle, bytes32 _jobId, uint256 _payment) 
    public
    onlyOwner
  {
    
    Chainlink.Request memory req = buildChainlinkRequest(_jobId, address(this), this.fulfill.selector);
    
    req.add("get", "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD");
    
    req.add("path", "USD");
    
    req.addInt("times", 100);
    
    sendChainlinkRequestTo(_oracle, req, _payment);
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
}
