    function _swap_token(address  _token_in,address  _token_out,uint _amountIn,uint _amountOutMin,address _to) external{
        address[] memory path;
        if (_token_in==WETH_Goerli || _token_out == WETH_Goerli){ 
        path = new address[](2);
        path[0]=_token_in;
        path[1] = _token_out;}
        else {
            path = new address[](3);
            path[0] = _token_in;
            path[1] = WETH_Goerli;
            path[2] = _token_out;
        }
        IUniswapV2Router(uniswap_goerli).swapExactTokensForTokens(_amountIn, _amountOutMin, path, _to, block.timestamp);
 }

       function getAmountOutMin(address _tokenIn, address _tokenOut, uint256 _amountIn) external view returns (uint256) {

        address[] memory path;
        if (_tokenIn == WETH_Goerli || _tokenOut == WETH_Goerli) {
            path = new address[](2);
            path[0] = _tokenIn;
            path[1] = _tokenOut;
        } else {
            path = new address[](3);
            path[0] = _tokenIn;
            path[1] = WETH_Goerli;
            path[2] = _tokenOut;
        }
        
        uint256[] memory amountOutMins = IUniswapV2Router(uniswap_goerli).getAmountsOut(_amountIn, path);
        return amountOutMins[path.length -1];}

    function get_balance_token(address _token) public view returns(uint){
        return ERC20(_token).balanceOf(address(this));
    }
