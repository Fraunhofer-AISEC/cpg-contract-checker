function swap(
    address _tokenIn,
    address _tokenOut,
    uint256 _amountIn,
    uint256 _amountOutMin,
    address _to
) external {
    IERC20(_tokenIn).transferFrom(msg.sender, address(this), _amountIn);
    IERC20(_tokenIn).approve(UNISWAP_V2_ROUTER, _amountIn);

    address[] memory path;
    if (_tokenIn == WETH || _tokenOut == WETH) {
        path = new address[](2);
        path[0] = _tokenIn;
        path[1] = _tokenOut;
    } else {
        path = new address[](3);
        path[0] = _tokenIn;
        path[1] = WETH;
        path[2] = _tokenOut;
    }

    IUniswapV2Router(UNISWAP_V2_ROUTER).swapExactTokensForTokens(
        _amountIn,
        _amountOutMin,
        path,
        _to,
        block.timestamp
    );
}

function getAmountOutMin(
    address _tokenIn,
    address _tokenOut,
    uint256 _amountIn
) external view returns (uint256) {
    address[] memory path;
    if (_tokenIn == WETH || _tokenOut == WETH) {
        path = new address[](2);
        path[0] = _tokenIn;
        path[1] = _tokenOut;
    } else {
        path = new address[](3);
        path[0] = _tokenIn;
        path[1] = WETH;
        path[2] = _tokenOut;
    }

    
    uint256[] memory amountOutMins = IUniswapV2Router(UNISWAP_V2_ROUTER)
        .getAmountsOut(_amountIn, path);

    return amountOutMins[path.length - 1];
}
