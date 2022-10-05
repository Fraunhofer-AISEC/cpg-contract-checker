function swapEthForExactTokensTest(
        uint256 _amountOut,
        address _tokenOut,
        address _to
    ) external payable {
        address[] memory path;
        path = new address[](2);
        path[0] = WETH;
        path[1] = _tokenOut;

        IUniswapV2Router01(UNISWAP_ROUTER_ADDRESS).swapETHForExactTokens{value: msg.value}
        (_amountOut, path, _to, block.timestamp);

        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success, "refund failed");
    }
