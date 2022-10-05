
pragma solidity ^0.8.7;

import '@chainlink/contracts/src/v0.8/ChainlinkClient.sol';
import '@chainlink/contracts/src/v0.8/ConfirmedOwner.sol';




contract FetchFromArray is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    uint public price;

    bytes32 private jobId;
    uint256 private fee;

    event RequestPrice(bytes32 indexed requestId, uint price);

    
    constructor() ConfirmedOwner(msg.sender) {
        setChainlinkToken(0x01BE23585060835E02B77ef475b0Cc51aA1e0709);
        setChainlinkOracle(0xf3FBB7f3391F62C8fe53f89B41dFC8159EE9653f);
        jobId = '7d80a6386ef543a3abb52817f6707e3b';
        fee = (1 * LINK_DIVISIBILITY) / 10; 
    }

    
    function requestPrice() public returns (bytes32 requestId) {
        Chainlink.Request memory req = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);

        
        
        req.add('get', 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&per_page=1');

        
        
        
        
        
        
        
        
        
        
        
        req.add('path', '0,current_price'); 
        
        return sendChainlinkRequest(req, fee);
    }

    
    function fulfill(bytes32 _requestId, uint _current_price) public recordChainlinkFulfillment(_requestId) {
        emit RequestPrice(_requestId, _current_price);
        price = _current_price;
    }

    
    function withdrawLink() public onlyOwner {
        LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
        require(link.transfer(msg.sender, link.balanceOf(address(this))), 'Unable to transfer');
    }
}


