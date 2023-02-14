pragma solidity ^0.6.0;

import "github.com/smartcontractkit/chainlink/evm-contracts/src/v0.6/ChainlinkClient.sol";



contract ChainlinkExample is ChainlinkClient {
  
  uint256 public currentPrice;
  address public owner;
  
    
  address ORACLE_ADDRESS = 0xB36d3709e22F7c708348E225b20b13eA546E6D9c;
  
  
  string constant JOBID = "f9528decb5c64044b6b4de54ca7ea63e";
  
  uint256 constant private ORACLE_PAYMENT = 1 * LINK / 10;

  constructor() public {
    setPublicChainlinkToken();
    owner = msg.sender;
  }

  
  
  
  function requestStockPrice(string memory ticker) 
    public
    onlyOwner
  {
    
    Chainlink.Request memory req = buildChainlinkRequest(stringToBytes32(JOBID), address(this), this.fulfill.selector);
    
    
    req.add("function", "GLOBAL_QUOTE");
    req.add("symbol", ticker);
    
    
    string[] memory copyPath = new string[](2);
    copyPath[0] = "Global Quote";
    copyPath[1] = "05. price";
    req.addStringArray("copyPath", copyPath);
    
    req.addInt("times", 100000000);
    
    sendChainlinkRequestTo(ORACLE_ADDRESS, req, ORACLE_PAYMENT);
  }

  
  function fulfill(bytes32 _requestId, uint256 _price)
    public
    
    recordChainlinkFulfillment(_requestId)
  {
    currentPrice = _price;
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
