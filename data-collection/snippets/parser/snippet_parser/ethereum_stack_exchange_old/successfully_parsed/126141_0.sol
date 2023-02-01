function getAmountOutMin(address _tokenIn, address _tokenOut, uint256 _amountIn) external view returns (uint256) {

    uint256 feeAmount = _amountIn.mul(_swapFee).div(100);
    uint256 totalToSwap = _amountIn.sub(feeAmount);

    address[] memory path;
    if (_tokenIn == uniswap.WETH() || _tokenOut == uniswap.WETH()) {
        path = new address[](2);
        path[0] = _tokenIn;
        path[1] = _tokenOut;
    } else {
        path = new address[](3);
        path[0] = _tokenIn;
        path[1] = uniswap.WETH();
        path[2] = _tokenOut;
    }
    
    uint256[] memory amountOutMins = uniswap.getAmountsOut(totalToSwap, path);
    return amountOutMins[path.length -1];  
}  
