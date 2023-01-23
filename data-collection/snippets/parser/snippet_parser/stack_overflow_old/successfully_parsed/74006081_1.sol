function swap (address _router, address _tokenIn, address _tokenOut, uint _amount) private onlyOwner {
    IERC20(_tokenIn).approve(_router,_amount);  
    address[] memory path;  
    path = new address[](2);
    path[0] = _tokenIn;
    path[1] = _tokenOut;
    uint deadline = block.timestamp+300;
    IUniswapV2Router02(_router).swapExactTokensForTokens(_amount,1,path, address(this), deadline);
}
