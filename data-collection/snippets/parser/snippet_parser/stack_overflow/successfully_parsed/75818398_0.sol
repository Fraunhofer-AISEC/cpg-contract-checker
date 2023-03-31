function _buy(bytes calldata _data) internal {
    (
        address router,
        uint256 amountIn,
        uint256 amountOutMin,
        address[] memory path
    ) = abi.decode(_data, (address, uint256, uint256, address[]));

    IERC20 fromToken = IERC20(path[0]);

    _approve(fromToken, router, amountIn);
    IPancakeRouter02(router)
        .swapExactTokensForTokensSupportingFeeOnTransferTokens(
            amountIn,
            amountOutMin,
            path,
            address(this),
            block.timestamp
        );
}
