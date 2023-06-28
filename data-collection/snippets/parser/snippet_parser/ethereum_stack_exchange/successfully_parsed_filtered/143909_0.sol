   function _swap_token(address  _token_in, address  _token_out,uint _amountIn,uint _amountOutMin) external OnlyOwner {
        address[] memory path;
        ERC20(_token_in).approve(uniswap_goerli,_amountIn);
        if (_token_in==WETH || _token_out == WETH){ 
        path = new address[](2);
        path[0]=_token_in;
        path[1] = _token_out;}
        IUniswapV2Router(uniswap_goerli).swapExactTokensForTokensSupportingFeeOnTransferTokens(_amountIn, _amountOutMin, path, address(this), block.timestamp);
 }
