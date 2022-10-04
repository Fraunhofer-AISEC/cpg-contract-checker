pragma solidity ^0.4.24;

import "chainlink/contracts/ChainlinkClient.sol";

contract ChainlinkAlarmClock is ChainlinkClient {

  uint256 oraclePayment;

  constructor(uint256 _oraclePayment) public {
    setPublicChainlinkToken();
    oraclePayment = _oraclePayment;
  }
  function delayStart(address _oracle, bytes32 _jobId) public onlyOwner {
    Chainlink.Request memory req = buildChainlinkRequest(_jobId, this, this.fulfill.selector);
    req.addUint("until", now + 5 minutes);
    sendChainlinkRequestTo(_oracle, req, oraclePayment);
  }
  function fulfill(bytes32 _requestId) public recordChainlinkFulfillment(_requestId) {
    
    
  }
  
}
