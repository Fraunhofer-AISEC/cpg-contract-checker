function _transfer(address from, address to, uint256 amount) private {
    require(from != address(0), "BEP20: transfer from the zero address");
    require(to != address(0), "BEP20: transfer to the zero address");
    require(amount > 0, "Transfer amount must be greater than zero");

    if(from == _pancakeswapV2LiquidityPair || to == _pancakeswapV2LiquidityPair) 
    {
        uint256 tFee = amount.mul(dexTaxFee).div(100);
        uint256 tTransferAmount = amount.sub(tFee);

        _balances[from] = _balances[from].sub(amount, "BEP20: Transfer amount exceeds balance");
        _balances[to] = _balances[to].add(tTransferAmount);

      

        emit Transfer(from, to, tTransferAmount);

        swapTokensForEthAndSend(tFee, _feesCollectingAddress);
      
    }
    else 
    {
        _balances[from] = _balances[from].sub(amount, "BEP20: Transfer amount exceeds balance");
        _balances[to] = _balances[to].add(amount);

        emit Transfer(from, to, amount);
    }
}
