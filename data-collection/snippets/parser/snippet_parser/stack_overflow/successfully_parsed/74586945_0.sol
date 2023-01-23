function swapWeth() public nonReentrant {
   uint balanceWETH = IWETH(WETH).balanceOf(address(this));

   if (balanceWETH > 0) {
      IERC20(WETH).approve(address(this), balanceWETH);
      IWETH(WETH).withdraw(balanceWETH);
   }
}
