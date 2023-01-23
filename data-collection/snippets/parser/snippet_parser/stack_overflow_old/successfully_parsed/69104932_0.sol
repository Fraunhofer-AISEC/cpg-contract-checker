function requestMultipleParameters(
bytes32 specId, 
uint256 payment) public{
specId = 0x3934636531316335393937643432336338646331383761653431306536653163;
payment = 100000000000000;
Chainlink.Request memory req = buildChainlinkRequest(specId, address(this), this.fulfillMultipleParameters.selector);
req.addUint("times", 10000);
requestOracleData(req, payment);}
