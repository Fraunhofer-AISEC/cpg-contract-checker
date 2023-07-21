function _transfer(address from, address to, uint256 amount) internal override {
    require(from != address(0), "ERC20: transfer from the zero address");
    require(to != address(0), "ERC20: transfer to the zero address");
    require(amount > 0, "amount must be greater than 0");


    if (from != owner() && to != owner() && to != address(0) && to != address(0xdead)) {
        if (!tradingActive) {
            require(_excludedFromFee[from] || _excludedFromFee[to], "Trading is not active.");
        }
        if (!_excludedMaxtx[from] || !_excludedMaxtx[to]) {
            require(balanceOf(to) + amount <= maxWallet);

    
    if (automatedMarketMakerPairs[from] && !_excludedFromFee[from]) {
       uint256 buyFee = (amount * sellTotalFees)/100;
       amount = amount - buyFee;
       super._transfer(from, to, amount);
       super._transfer(from, feeWallet, buyFee);
       
    
    } else if (automatedMarketMakerPairs[to] && !_excludedFromFee[from]){
        uint256 sellFee = (amount * sellTotalFees)/100;
        amount = amount - sellFee;
        super._transfer(from, to, amount);
        super._transfer(from, feeWallet, sellFee);
    }
  }
}
    super._transfer(from, to, amount);

}

