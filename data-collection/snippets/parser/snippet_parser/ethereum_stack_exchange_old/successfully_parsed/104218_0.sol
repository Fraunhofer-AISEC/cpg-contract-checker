pragma solidity ^0.6.7;

import "@chainlink/contracts/src/v0.6/ChainlinkClient.sol";

contract APIConsumerInfo is ChainlinkClient
{
uint256 public lowDay;
uint256 public highDay;

address private oracle;
bytes32 private jobID;
uint256 private fee;

constructor() public
{
    setPublicChainlinkToken();
    oracle = 0x2f90A6D021db21e1B2A077c5a37B3C7E75D15b7e;
    jobID = "29fa9aa13bf1468788b7cc4a500a45b8";
    fee = 0.1 * 10 ** 18;
}

function requestLowDay() public returns (bytes32 requestID)
{
    Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);  
    request.add("get", "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH&tsyms=USD");
    request.add("path", "RAW.ETH.USD.LOWDAY");
    int timesAmount = 10**2;
    request.addInt("times", timesAmount);
    return sendChainlinkRequestTo(oracle, request, fee);
}

function fulfill(bytes32 _requestId, uint256 _dayLow) public recordChainlinkFulfillment(_requestId)
{
    lowDay = _dayLow;
}

function requestHighDay() public returns (bytes32 requestID)
{
    Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);  
    request.add("get", "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH&tsyms=USD");
    request.add("path", "RAW.ETH.USD.HIGHDAY");
    int timesAmount = 10**2;
    request.addInt("times", timesAmount);
    return sendChainlinkRequestTo(oracle, request, fee);
}

function fulfill(bytes32 _requestId, uint256 _dayHigh) public recordChainlinkFulfillment(_requestId)
{
    highDay = _dayHigh;
}

function withdrawLink() external 
{
    LinkTokenInterface linkToken = LinkTokenInterface(chainlinkTokenAddress());
    require(linkToken.transfer(msg.sender, linkToken.balanceOf(address(this))), "Unable to transfer");
}
}
