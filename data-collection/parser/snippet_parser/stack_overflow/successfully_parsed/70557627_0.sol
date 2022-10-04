pragma solidity ^0.8.7;

import "github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.8/ChainlinkClient.sol";





contract getHTTP is ChainlinkClient {
  using Chainlink for Chainlink.Request;

  bytes32 private thisDoesNotWork;
  address private owner;
  address private ORACLE_ADDRESS = 0x718Cc73722a2621De5F2f0Cb47A5180875f62D60;
  bytes32 private JOBID = stringToBytes32("86b489ec4d84439c96181a8df7b22223");
  string private url = "<myHTTPAddressAsString>"; 




  uint256 constant private ORACLE_PAYMENT = 100000000000000000;

  constructor() public {
    
    setPublicChainlinkToken();
    owner = msg.sender;
  }

  function requestBytes() 
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(JOBID, address(this), this.fulfill.selector);
    req.add("get", url);
    sendChainlinkRequestTo(ORACLE_ADDRESS, req, ORACLE_PAYMENT);
  }

  function fulfill(bytes32 _requestId, bytes32 recVal)
    public
    recordChainlinkFulfillment(_requestId)
  {
    thisDoesNotWork = recVal;
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
