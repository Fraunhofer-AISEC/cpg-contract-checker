constructor() {
_totalSupply = 10 * _billion * _decimalPointsCalc;
_balances[msg.sender] = _totalSupply;

_isExcludedFromInterest[owner()] = true;
_isExcludedFromTax[owner()] = true;
_isExcludedFromTax[address(this)] = true;
_isExcludedFromTax[address(0x0000000000000000000000000000000000000000)] = true;

_taxStorageDestination = payable(owner());
_testPancakeswapContract = payable(0x9Ac64Cc6e4415144C455BD8E4837Fea55603e5c3);
_pancakeswapRouterContract = _testPancakeswapContract;  

IUniswapV2Router02 pancakeswapV2Router = IUniswapV2Router02(_pancakeswapRouterContract);
_pancakeswapV2LiquidityPair = IUniswapV2Factory(pancakeswapV2Router.factory())
    .createPair(address(this), pancakeswapV2Router.WETH()); 
_pancakeswapV2Router = pancakeswapV2Router;

emit Transfer(address(0), msg.sender, _totalSupply);
}
