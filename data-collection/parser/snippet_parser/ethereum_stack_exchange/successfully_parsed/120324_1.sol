function swapTokensForExactEthTest(
        uint256 _amountOut,
        address _tokenIn,
        uint256 _amountInMax,
        address _to
    ) external {
        IERC20(_tokenIn).transferFrom(msg.sender, address(this), _amountInMax);
        IERC20(_tokenIn).approve(UNISWAP_ROUTER_ADDRESS, _amountInMax);

        address[] memory path;
        path = new address[](2);
        path[0] = _tokenIn;
        path[1] = WETH;

        IUniswapV2Router01(UNISWAP_ROUTER_ADDRESS).swapTokensForExactETH(
            _amountOut,
            _amountInMax,
            path,
            _to,
            block.timestamp
        );
    }
