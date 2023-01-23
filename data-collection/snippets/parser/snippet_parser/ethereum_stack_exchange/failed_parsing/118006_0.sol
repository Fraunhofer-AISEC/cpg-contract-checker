    constructor (address marketingWallet) {
        _rOwned[_msgSender()] = _rTotal;
         _marketingWallet = payable(marketingWallet);
 
        
        IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(0x10ED43C718714eb63d5aA57B78B54704E256024E);
