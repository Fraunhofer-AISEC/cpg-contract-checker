function validPurchase() internal returns (bool) {
    bool lessThanMaxInvestment = msg.value <= 10 ether; 
    bool whitelisted = addressIsWhitelisted(msg.sender); 
    return super.validPurchase() && lessThanMaxInvestment && whitelisted;
}
