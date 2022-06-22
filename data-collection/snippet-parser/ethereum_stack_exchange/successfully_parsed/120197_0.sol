function setMaxTxPercent(uint256 maxTxPercent) external onlyOwner() {

    _maxTxAmount = _tTotal.mul(maxTxPercent).div(
        10**2
    );
}
                                                                                                                                  
function _transfer(
    address from,
    address to,
    uint256 amount
) private {
    require(from != address(0), "ERC20: transfer from the zero address");
    require(to != address(0), "ERC20: transfer to the zero address");
    require(amount > 0, "Transfer amount must be greater than zero");
    if(from != owner() && to != owner())
        require(amount <= _maxTxAmount, "Transfer amount exceeds the maxTxAmount.");

    
    
    
    
    uint256 contractTokenBalance = balanceOf(address(this));
    
    if(contractTokenBalance >= _maxTxAmount)
    {
        contractTokenBalance = _maxTxAmount;
    }
    
    bool overMinTokenBalance = contractTokenBalance >= numTokensSellToAddToLiquidity;
    if (
        overMinTokenBalance &&
        !inSwapAndLiquify &&
        from != uniswapV2Pair &&
        swapAndLiquifyEnabled
    ) {
        contractTokenBalance = numTokensSellToAddToLiquidity;
        
        swapAndLiquify(contractTokenBalance);
    }
    
    
    bool takeFee = true;
    
    
    if(_isExcludedFromFee[from] || _isExcludedFromFee[to]){
        takeFee = false;
    }
    
    
    _tokenTransfer(from,to,amount,takeFee);
}

uint256 public _maxTxAmount = 1000000000000 * 10**3 * 10**9;
uint256 private numTokensSellToAddToLiquidity = 5000000 * 10**3 * 10**9;
