pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";
import "@openzeppelin/contracts/utils/Strings.sol";





contract MultiWordConsumer is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    struct Trade{
        string price;
    }

    bytes32 private jobId;
    uint256 private fee;

    
    Trade[] public trades;
   

    event RequestMultipleFulfilled(
        bytes32 indexed requestId,
        Trade[] indexed prices
    );

    
    constructor() ConfirmedOwner(msg.sender) {
        setChainlinkToken(0x779877A7B0D9E8603169DdbD7836e478b4624789); 
        setChainlinkOracle(0x2D470Df5823edefe6941F8F737660661e47f62af); 
        jobId = "3464b5f4c3f74b66a22f881506d2aae5"; 
        fee = (1 * LINK_DIVISIBILITY) / 10; 
    }

    
    function requestMultipleParameters() public {
        Chainlink.Request memory req = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfillMultipleParameters.selector
        );
        req.add(
            "url",
            "https://api3.binance.com/api/v3/trades?symbol=BTCUSDT&limit=5"
        );

        for(uint i=0; i<5; i++){
        string memory strindex = Strings.toString(i);
        uint index = i + 1;
        string memory pathindex = Strings.toString(index);
        req.add(string.concat("path",pathindex), string.concat(strindex,",price"));

        }
        
        
        
        
        sendChainlinkRequest(req, fee); 
    }

    
    function fulfillMultipleParameters(
        bytes32 requestId,
        Trade[] memory _prices
    ) public recordChainlinkFulfillment(requestId) {
        emit RequestMultipleFulfilled(
            requestId,
            _prices
        );

        for(uint i = 0; i< _prices.length; i++){
            trades.push(_prices[i]);
        }

    }

    function viewprice() public view returns(Trade[] memory ){
       
        return trades;
    }

    
    function withdrawLink() public onlyOwner {
        LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
        require(
            link.transfer(msg.sender, link.balanceOf(address(this))),
            "Unable to transfer"
        );
    }
}```



 
