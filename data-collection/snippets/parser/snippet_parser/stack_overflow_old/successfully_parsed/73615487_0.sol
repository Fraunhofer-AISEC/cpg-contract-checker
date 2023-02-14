function removeLiquidity(uint256 percent) external onlyOwner {
    
    uint256 lpBalance = IERC20(lpPair).balanceOf(address(this));

    uint256 lpAmount = lpBalance * percent / 10000;

    IERC20(lpPair).approve(address(dexRouter), lpAmount);

    dexRouter.removeLiquidityETH(
        address(this),
        lpAmount,
        1, 
        1, 
        address(this),
        block.timestamp
    );
}
