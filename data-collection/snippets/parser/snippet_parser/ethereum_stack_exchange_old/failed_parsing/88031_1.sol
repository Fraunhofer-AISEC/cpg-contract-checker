public uint256 count;
function addOne(bytes32 _requestId) public recordChainlinkFulfillment(_requestId){
        count = count + 1;
    }

function randomlyCall() public {
Chainlink.Request memory req = buildChainlinkRequest(jobId, address(this), this.addOne.selector);
        sendChainlinkRequestTo(oracle, req, fee);
}
