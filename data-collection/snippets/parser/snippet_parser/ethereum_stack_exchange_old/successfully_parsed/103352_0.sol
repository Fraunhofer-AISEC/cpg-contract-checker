
function swapExactTokensForETHOwn(address _tokenIn , uint256 _amountIn , uint256 _amountOutMin, uint256 deadline, address _contractAddress) external {

    IERC20 erc20 = IERC20(_tokenIn);

    erc20.transferFrom(msg.sender, _contractAddress, _amountIn);
    erc20.approve(UNISWAP_ROUTER_ADDRESS, _amountIn);
    
    
    

    address[] memory path = new address[](2);
    path[0] = _tokenIn;
    path[1] = WETHR;

    uniswap.swapExactTokensForETH(
        _amountIn,
        _amountOutMin,
        path,
        msg.sender,
        deadline
    );

}
