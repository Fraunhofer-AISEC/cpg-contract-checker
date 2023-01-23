function _transfer(
    address from,
    address to,
    uint256 amount
) internal override {
    
    require(from != address(0), "ERC20: transfer from the zero address");
    require(to != address(0), "ERC20: transfer to the zero address");

    if(amount == 0) {
        super._transfer(from, to, 0);
        return;
    }


    bool takeFee = !swappingToBnb && !_isExcludedFromFees[from] && !_isExcludedFromFees[to];

     if(takeFee) {
    
        uint256 contractTokenBalance = balanceOf(address(this));
        
        if(contractTokenBalance>0)
        {
           sellForBNBAndSendToDev();
        }
        
        uint256 fees = amount.mul(devFee).div(100);
        amount = amount.sub(fees);
        super._transfer(from, address(this), fees);
        
    }

    super._transfer(from, to, amount);


}
