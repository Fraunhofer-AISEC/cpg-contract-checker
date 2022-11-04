function increaseLiquidityCurrentRange(
    uint256 tokenId,
    uint256 amountAdd0,
    uint256 amountAdd1
)
    external
    returns (
        uint128 liquidity,
        uint256 amount0,
        uint256 amount1
    ) {

    TransferHelper.safeTransferFrom(deposits[tokenId].token0, msg.sender, address(this), amountAdd0);
    TransferHelper.safeTransferFrom(deposits[tokenId].token1, msg.sender, address(this), amountAdd1);

    TransferHelper.safeApprove(deposits[tokenId].token0, address(nonfungiblePositionManager), amountAdd0);
    TransferHelper.safeApprove(deposits[tokenId].token1, address(nonfungiblePositionManager), amountAdd1);

    INonfungiblePositionManager.IncreaseLiquidityParams memory params = INonfungiblePositionManager.IncreaseLiquidityParams({
        tokenId: tokenId,
        amount0Desired: amountAdd0,
        amount1Desired: amountAdd1,
        amount0Min: 0,
        amount1Min: 0,
        deadline: block.timestamp
    });

    (liquidity, amount0, amount1) = nonfungiblePositionManager.increaseLiquidity(params);

}
