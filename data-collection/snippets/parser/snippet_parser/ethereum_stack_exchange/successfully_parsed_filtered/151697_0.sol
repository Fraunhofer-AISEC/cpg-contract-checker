

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract WeatherConsumer is ChainlinkClient {
    using Chainlink for Chainlink.Request;

    address public owner;
    uint256 public rain;
    bytes32 private jobId;
    uint256 private fee;
    string constant WEATHERBIT_PATH = "data,0,precip";
    string constant API_URL =
        "https://api.weatherbit.io/v2.0/current?lat=8.503800&lon=-75.509070&key={My_Api_Key}";

    event RequestRain(bytes32 indexed requestId, uint256 rain);

    modifier onlyOwner() {
        require(
            owner == msg.sender,
            "Only the address that deployed the contract."
        );
        _;
    }

    
    constructor() {
        setChainlinkToken(0x779877A7B0D9E8603169DdbD7836e478b4624789);
        setChainlinkOracle(0x6090149792dAAeE9D1D568c9f9a6F6B46AA29eFD);
        jobId = "ca98366cc7314957b8c012c72f05aeeb";
        fee = (1 * LINK_DIVISIBILITY) / 10;
        owner = msg.sender;
    }

    function requestRainData() public returns (bytes32 requestId) {
        Chainlink.Request memory req = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfill.selector
        );

        req.add("get", API_URL);
        req.add("path", WEATHERBIT_PATH);

        int256 timesAmount = 10**18;
        req.addInt("times", timesAmount);

        return sendChainlinkRequest(req, fee);
    }

    function fulfill(bytes32 _requestId, uint256 _rain)
        public
        recordChainlinkFulfillment(_requestId)
    {
        emit RequestRain(_requestId, _rain);
        rain = _rain;
    }

    function withdrawLink() public onlyOwner {
        LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
        require(
            link.transfer(msg.sender, link.balanceOf(address(this))),
            "Unable to transfer"
        );
    }
}

