   function startArbitrage() external {
    IUniswapV2Router01 router = IUniswapV2Router01(router);

    address pairAddress = IUniswapV2Factory(address(0xcA143Ce32Fe78f1f7019d7d551a6402fC5350c73)).getPair(CAKE, WBNB);

    require(pairAddress != address(0), 'This pool does not exist');
    IUniswapV2Pair(pairAddress).swap(
      0, 
      10000000000000000000000, 
      address(this), 
      bytes('not empty')
    );
}


function pancakeCall(address _sender, uint _amount0, uint _amount1, bytes calldata _data) external {
    IUniswapV2Router01 pcRouter = IUniswapV2Router01(router);

    require(msg.sender == IUniswapV2Factory(address(0xcA143Ce32Fe78f1f7019d7d551a6402fC5350c73)).getPair(CAKE, WBNB), 'Unauthorized'); 

    

    uint amountToken = _amount1;

    IERC20 token = IERC20(WBNB);
    token.approve(address(router), type(uint256).max);

    uint amountRequired = amountToken;

    address[] memory path = new address[](2);
    path[0] = WBNB;
    path[1] = CAKE;
    
    uint cakeReceived = pcRouter.swapExactTokensForTokens(amountToken, amountRequired, path, address(this), block.timestamp + 10)[1];
    
    address[] memory path1 = new address[](2);
    path1[0] = CAKE;
    path1[1] = BUSD;
    uint busdReceived = pcRouter.swapExactTokensForTokens(cakeReceived, cakeReceived, path1, address(this), block.timestamp + 10)[1];

    address[] memory path2 = new address[](2);
    path1[0] = BUSD;
    path1[1] = WBNB;
    uint wbnbReceived = pcRouter.swapExactTokensForTokens(busdReceived, busdReceived, path2, address(this), block.timestamp + 10)[1];
    
    token.transfer(msg.sender, amountRequired);

}
