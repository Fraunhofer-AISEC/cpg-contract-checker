function placeTrade(address _fromToken,address _toToken,uint256 _amountIn) payable public returns (uint256) {



    address pair = IUniswapV2Factory(PANCAKE_FACTORY).getPair(_fromToken,_toToken);
    
    require(pair != address(0), "Pool does not exist (for trade)");

    
    address[] memory path = new address[](2);
    path[0] = _fromToken;
    path[1] = _toToken;
    uint256 amountRequired = IUniswapV2Router01(PANCAKE_ROUTER).getAmountsOut(_amountIn, path)[1];


    uint256 amountReceived ;

    if (_fromToken == WBNB) {
         

        amountReceived = IUniswapV2Router02(PANCAKE_ROUTER).swapExactETHForTokens{value: _amountIn}(amountRequired,path,address(this),deadline)[1];    
   
    }
    else{
        
        amountReceived = IUniswapV2Router02(PANCAKE_ROUTER).swapExactTokensForTokens(_amountIn,amountRequired,path,address(this),deadline)[1];
        
    }
    require(amountReceived > 0, "Aborted Tx: Trade returned zero");


    return amountReceived;
}
