  
function fulfillWeight(bytes32 _requestId, uint256 _weight) public recordChainlinkFulfillment(_requestId)
{
    weight = _weight;
}

function fulfillHeight(bytes32 _requestId2, uint256 _height) public recordChainlinkFulfillment(_requestId2)
{
    height = _height;
}
