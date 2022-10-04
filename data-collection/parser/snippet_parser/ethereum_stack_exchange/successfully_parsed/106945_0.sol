IUniswapV2Router02 immutable uniswapV2Router;
IUniswapV2Router02 immutable sushiswapRouter;
    
struct Path {
    address[] route;
}
    
constructor() public {
    uniswapV2Router = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
    sushiswapRouter = IUniswapV2Router02(0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506);
}

function _swap(IUniswapV2Router02 _router, address[] memory _route, uint256 _amount) private returns (uint256) {
    uint256 deadline = getDeadline();
        
    require(
        IERC20(_route[0]).approve(address(_router), _amount),
        "Could not approve token swap on Uniswap"
    );
            
    uint256[] memory amountsReceived = _router.swapExactTokensForTokens(_amount, 0, _route, address(this), deadline);
    return amountsReceived[amountsReceived.length - 1];
}

function doMySwap(Path memory _pathA, Path memory _pathB) public onlyOwner {
    uint256 uniAmountReceived = _swap(uniswapV2Router, _pathA.route, IERC20(_pathA.route[0]).balanceOf(address(this)));
    uint256 sushiAmountReceived = _swap(sushiswapRouter, _pathB.route, uniAmountReceived);
}
