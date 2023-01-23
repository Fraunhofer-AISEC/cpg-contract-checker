...
contract Arbitrage {
    
    IUniswapV2Router02 public sushiRouter = IUniswapV2Router02(0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506);
    
    event test (uint timestamp, uint amountIn, uint amountOut, address[] path, uint allowance, address sender);
    
    function swapper(address token1, address token2) public  {
        address[] memory path = new address[](2);
        path[0] = token1;
        path[1] = token2;
        uint amountOut = 1 ether;
        uint amountIn = sushiRouter.getAmountsIn(
            amountOut,
            path
        )[0];
        
        IERC20(token1).approve(address(sushiRouter), amountIn);
        IERC20(token2).approve(address(sushiRouter), amountOut);
        
        uint allowed = IERC20(token1).allowance(msg.sender, address(sushiRouter));
        
        
        emit test(now+90, amountIn, amountOut, path, allowed, msg.sender);
    }
}
