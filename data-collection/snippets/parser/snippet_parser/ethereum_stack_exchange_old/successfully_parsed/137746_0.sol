
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract Vjk_APIConsumer is ChainlinkClient {
    using Chainlink for Chainlink.Request;

    mapping(bytes32 => string) public quotes;
    address private immutable oracle;
    bytes32 private immutable jobId;
    uint256 private immutable fee;

    event DataFullfilled(bytes32 indexed requestId, string quotes);

    constructor(
        address _oracle,
        bytes32 _jobId,
        uint256 _fee,
        address _link
    ) {
        if (_link == address(0)) {
            setPublicChainlinkToken();
        } else {
            setChainlinkToken(_link);
        }
        oracle = _oracle;
        jobId = _jobId;
        fee = _fee;
    }

    function requestQuoteData() public returns (bytes32 requestId) {
        Chainlink.Request memory request = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfill.selector
        );

        request.add("get", "https://api.kanye.rest/");

        request.add("path", "quote");

        int256 timesAmount = 1;
        request.addInt("times", timesAmount);

        return sendChainlinkRequestTo(oracle, request, fee);
    }

    function fulfill(bytes32 _requestId, string memory _quote)
        public
        recordChainlinkFulfillment(_requestId)
    {
        quotes[_requestId] = _quote;
        emit DataFullfilled(_requestId, _quote);
    }

    function withdrawLink() external {}
}

