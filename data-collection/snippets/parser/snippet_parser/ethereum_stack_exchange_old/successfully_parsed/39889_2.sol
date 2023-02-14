function validPurchase() internal returns (bool) {
    bool lessThanMaxInvestment = msg.value <= 10 ether; 
    return super.validPurchase() && lessThanMaxInvestment
}
