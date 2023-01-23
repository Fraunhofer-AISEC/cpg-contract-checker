



pragma solidity ^0.6.0;

import "https://raw.githubusercontent.com/smartcontractkit/chainlink/develop/evm-contracts/src/v0.6/ChainlinkClient.sol";


contract ChainlinkExample is ChainlinkClient {
  
  uint256 public currentPrice;
  address public owner;

  address ORACLE_ADDRESS = 0x074715cc07fC0Df9c617F22971Fb2Ff1b1f57278;
  string constant JOBID = "c734c40b377544f08a7324f36bda4940";

  uint256 constant private ORACLE_PAYMENT = 20000000000000000;

  constructor() public {
    
    setPublicChainlinkToken();
    owner = msg.sender;
  }
  
  
  function requestEthereumPrice() public onlyOwner{
    Chainlink.Request memory req = buildChainlinkRequest(stringToBytes32(JOBID), address(this), this.fulfill.selector);
    req.add("get", "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD");
    req.add("path", "USD");
    req.addInt("times", 100);
    sendChainlinkRequestTo(ORACLE_ADDRESS, req, ORACLE_PAYMENT);
  }

  
  function fulfill(bytes32 _requestId, uint256 _price) public recordChainlinkFulfillment(_requestId) { 
    currentPrice = _price;
  }
  
  
  function cancelRequest(bytes32 _requestId, uint256 _payment, bytes4 _callbackFunctionId, uint256 _expiration) public onlyOwner {
    cancelChainlinkRequest(_requestId, _payment, _callbackFunctionId, _expiration);
  }

  
  
  function withdrawLink() public onlyOwner{
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
