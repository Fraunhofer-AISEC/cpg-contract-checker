
pragma solidity ^0.8.7;

import '@chainlink/contracts/src/v0.8/ChainlinkClient.sol';
import '@chainlink/contracts/src/v0.8/ConfirmedOwner.sol';




contract APIConsumer is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    uint256 public price;
    bytes32 private jobId;
    uint256 private fee;

    event RequestPrice(bytes32 indexed requestId, uint256 price);

    
    constructor() ConfirmedOwner(msg.sender) {
        setChainlinkToken(0x01BE23585060835E02B77ef475b0Cc51aA1e0709);
        setChainlinkOracle(0xf3FBB7f3391F62C8fe53f89B41dFC8159EE9653f);
        jobId = 'ca98366cc7314957b8c012c72f05aeeb';
        fee = (1 * LINK_DIVISIBILITY) / 10; 
    }

    function requestBaycPrice() public returns (bytes32 requestId) {
        Chainlink.Request memory req = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);

        
        req.add('get', 'https://api.coingecko.com/api/v3/coins/bayc-vault-nftx');

        
        req.add('path', 'market_data,current_price,usd'); 

        
        int256 timesAmount = 10**18;
        req.addInt('times', timesAmount);

        
        return sendChainlinkRequest(req, fee);
    }

    
    function fulfill(bytes32 _requestId, uint256 _price) public recordChainlinkFulfillment(_requestId) {
        emit RequestPrice(_requestId, _price);
        price = _price;
    }

    
    function withdrawLink() public onlyOwner {
        LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
        require(link.transfer(msg.sender, link.balanceOf(address(this))), 'Unable to transfer');
    }
}
