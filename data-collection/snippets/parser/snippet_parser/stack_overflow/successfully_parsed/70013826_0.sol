function uniswapSwap(uint256 daiAmount) public payable {
    
    uint256 amountIn = daiAmount;
    
    address kovanDAI = address(0x4F96Fe3b7A6Cf9725f59d353F723c1bDb64CA6Aa);
    IERC20 DAI= IERC20(kovanDAI);
    address uniswapRouterAddress = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    
    IUniswapV2Router02 uniswapRouter2 = IUniswapV2Router02(uniswapRouterAddress);
    
    require(DAI.approve(address(uniswapRouter2), amountIn), 'approve failed.');
    
    address[] memory path = new address[](2);
    path[0] = address(DAI);
    path[1] = uniswapRouter2.WETH();
    uint deadline = block.timestamp + 15;
    uint[] memory amounts = uniswapRouter.swapExactTokensForETH(daiAmount, 0, path, address(this), deadline);
    
}
