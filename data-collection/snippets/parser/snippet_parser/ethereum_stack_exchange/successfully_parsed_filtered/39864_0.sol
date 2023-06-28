function validPurchase() internal returns (bool) {
    bool moreThanMinimalInvestment = msg.value >= 0.1 ether; 
    return super.validPurchase() && moreThanMinimalInvestment
}
