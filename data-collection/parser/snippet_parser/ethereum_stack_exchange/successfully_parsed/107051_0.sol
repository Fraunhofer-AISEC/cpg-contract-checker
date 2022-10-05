    function requestAlarmClock(uint256 durationInSeconds) public returns (bytes32 requestId) 
{
    Chainlink.Request memory request = buildChainlinkRequest(_jobId, address(this), this.fulfillAlarm.selector);
    
    request.addUint("until", block.timestamp + durationInSeconds);
    return sendChainlinkRequestTo(_oracle, request, oraclePayment);
}

  
function fulfillAlarm(bytes32 _requestId, uint256 _volume) public recordChainlinkFulfillment(_requestId)
{

    token.transferFrom(owner, _reciver, 2e18);
}
