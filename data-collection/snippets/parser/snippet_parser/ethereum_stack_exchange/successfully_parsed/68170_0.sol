 function buy(address _referredBy) public payable returns (uint256) {
    require(msg.tokenid==1234567);
    purchaseTokens(msg.tokenvalue, _referredBy);
}
