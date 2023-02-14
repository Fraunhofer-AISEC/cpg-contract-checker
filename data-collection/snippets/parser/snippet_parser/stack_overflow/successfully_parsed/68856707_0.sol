function requestBytes() public returns (bytes32 requestId) {
    address oracle = "0xc57B33452b4F7BB189bB5AfaE9cc4aBa1f7a4FD8";
    bytes32 specId = "7a97ff8493ec406d90621b2531f9251a";
    uint256 payment = 100000000000000000;
    Chainlink.Request memory req = buildChainlinkRequest(specId, address(this), this.fulfillBytes.selector);
    req.add("get","https://ipfs.io/ipfs/QmZgsvrA1o1C8BGCrx6mHTqR1Ui1XqbCrtbMVrRLHtuPVD?filename=big-api-response.json");
    req.add("path", "image");
    return sendChainlinkRequestTo(oracle, req, payment);
}

event RequestFulfilled(
    bytes32 indexed requestId,
    bytes indexed data
);

function fulfillBytes(
    bytes32 requestId,
    bytes memory bytesData
)
    public
    recordChainlinkFulfillment(requestId)
{
    emit RequestFulfilled(requestId, bytesData);
    data = bytesData;
    url = string(data);
}
