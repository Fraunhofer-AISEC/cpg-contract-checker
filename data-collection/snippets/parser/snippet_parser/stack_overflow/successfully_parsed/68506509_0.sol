function receiveTokensAndDistributeEth(uint256 amount, address token) external override {
    require(amount > 0, "Distribution: Amount must be greater than 0");
    
    address WETH = router.WETH();
    IERC20(token).transferFrom(address(msg.sender), address(this), amount);
    IERC20(token).approve(address(router), amount);

    uint balanceBefore = IERC20(token).balanceOf(address(this)); 

    
    try IUniswapV2Pair(token).getReserves() {
        
    } catch {
        uint balanceAfter = IERC20(token).balanceOf(address(this)); 
    }
}
