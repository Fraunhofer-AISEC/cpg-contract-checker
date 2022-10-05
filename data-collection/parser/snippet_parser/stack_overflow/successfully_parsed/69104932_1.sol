function fulfillMultipleParameters(
bytes32 requestId,
uint256 usdResponse,
uint256 eurResponse,
uint256 jpyResponse)
public
recordChainlinkFulfillment(requestId){
emit RequestMultipleFulfilled(requestId, usdResponse, eurResponse, jpyResponse);
usd = usdResponse;
eur = eurResponse;
jpy = jpyResponse;}
