solidity
address[] public oracles;  
address[] public jobs;
function loop_through() public {

}
function get_weather_today(address _address, bytes32 _jobID) 
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(_jobID, address(this), this.fulfill.selector);
    req.add("get", "weather_URL");
    req.add("path", "today");
    sendChainlinkRequestTo(_address, req, ORACLE_PAYMENT);
  }
