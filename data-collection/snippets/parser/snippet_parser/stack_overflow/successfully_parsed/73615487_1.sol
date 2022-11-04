function removeLiquidity() external onlyOwner {
    
    uint256 lpBalance = IERC20(lpPair).balanceOf(address(this));

    IERC20(lpPair).approve(address(dexRouter), lpBalance);

    dexRouter.removeLiquidityETH(
        address(this),
        lpBalance,
        1, 
        1, 
        address(this),
        block.timestamp
    );
}
