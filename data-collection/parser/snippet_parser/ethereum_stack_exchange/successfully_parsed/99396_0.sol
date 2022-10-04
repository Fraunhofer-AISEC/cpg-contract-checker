constructor () {
    _rOwned[_msgSender()] = _rTotal;
    IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(0x10ED43C718714eb63d5aA57B78B54704E256024E);       
    
    
    uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory()).createPair(address(this), _uniswapV2Router.WETH());
    uniswapV2Router = _uniswapV2Router;
    _isExcludedFromFee[owner()] = true;
    _isExcludedFromFee[address(this)] = true;
    _isExcludedFromReward[address(this)] = true;
    _isExcludedFromFee[BURN_ADDRESS] = true;
    _isExcludedFromReward[BURN_ADDRESS] = true;
    emit Transfer(address(0), _msgSender(), _tTotal);
}
