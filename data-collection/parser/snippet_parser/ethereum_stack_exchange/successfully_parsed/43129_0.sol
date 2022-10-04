function() public payable {
    buyTokens(msg.sender, msg.value);
}

function buyTokens(address buyer, uint256 weiAmount) internal {
    require(checkPreSaleOn() || checkGeneralSaleOn());
    require(!halted);
    require(buyer != address(0));
    require(weiAmount > 0);
    require(weiAmount % 1 ether == 0); 
    uint256 numTokens;

    if (state == State.PreSale) {
        require(weiAmount <= 20000000000000000000); 
        numTokens = weiAmount.div(preSaleExchangeRateinWei);
    }
    if (state == State.GeneralSale) {
        require(weiAmount <= 20000000000000000000); 
        numTokens = weiAmount.div(generalSaleExchangeRateinWei);
    }

    investedAmount[buyer] = investedAmount[buyer].add(weiAmount);
    fundsRaisedInWei = fundsRaisedInWei.add(weiAmount);

    allocatedTokens[buyer] = allocatedTokens[buyer].add(numTokens);
    tokensIssued = tokensIssued.add(numTokens);
    TokensPurchase(buyer, weiAmount, numTokens);

    wallet.transfer(weiAmount);
}
