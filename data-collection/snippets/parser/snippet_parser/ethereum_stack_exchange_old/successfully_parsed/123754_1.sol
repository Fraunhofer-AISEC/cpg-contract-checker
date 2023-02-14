function donate(uint256 _payAmount) public payable  {

(bool success,) = owner.call{value: _payAmount}("");
 require(success, "Failed to send money");
 CRON token = CRON(0x2F718Bc4390F8662bB664D1FDd88494ac6bE71eC);
 uint256 cost =  _payAmount * 6 * priceFeed.latestRoundData ;
 token.transfer(owner,cost);
}  
