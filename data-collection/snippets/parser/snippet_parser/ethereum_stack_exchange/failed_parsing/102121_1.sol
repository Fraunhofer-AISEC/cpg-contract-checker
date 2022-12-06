constructor () {
    _rOwned[_msgSender()] = _rTotal;
    
    IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(0x?????);
     
    uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())
        .createPair(address(this), _uniswapV2Router.WETH());

    
    uniswapV2Router = _uniswapV2Router;
    
    
    _isExcludedFromFee[owner()] = true;
    _isExcludedFromFee[address(this)] = true;
    
    emit Transfer(address(0), _msgSender(), _tTotal);
}
