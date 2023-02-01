 
 address private wbnb = 0xae13d989daC2f0dEbFf460aC112a837C89BAa7cd;

 function buy(address token, uint256 amountIn, uint256 amountOutMin) external{

    if(msg.sender == me)
    {
        address[] memory path = new address[](2);
        path[0] = wbnb;
        path[1] = token;

         uniswapV2Router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            amountIn, 
            amountOutMin,
            path, 
            address(this),
            block.timestamp
        );
    }
         
}     


function sell(address token, uint256 amountIn, uint256 amountOutMin) external {

    if(msg.sender == me)
    {           

        address[] memory path = new address[](2);
        path[0] = token;
        path[1] = wbnb;
        
        
        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
           amountIn, 
            amountOutMin,
            path, 
            address(this),
            block.timestamp
        ); 
    }

}
