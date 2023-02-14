    constructor () {
    _rOwned[_msgSender()] = _rTotal; 
    
    ISummitSwapRouter01 _summitSwapRouter = ISummitSwapRouter01(0x10ED43C718714eb63d5aA57B78B54704E256024E);
     
    summitSwapPair = ISummitSwapFactory(_summitSwapRouter.factory())
        .createPair(address(this), _summitSwapRouter.WETH());    
    
    
    _isExcludedFromFee[owner()]             = true;
    _isExcludedFromFee[address(this)]       = true;
    _isExcludedFromFee[_CodradoLiquidityProviderAddress]   = true;


    
    _isExcludedFromReflection[address(0)] = true;
    _isExcludedFromReflection[0x000000000000000000000000000000000000dEaD] = true;
    
    emit Transfer(address(0), _msgSender(), _tTotal);
}
