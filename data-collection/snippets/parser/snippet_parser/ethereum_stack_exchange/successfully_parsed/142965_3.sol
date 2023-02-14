function withdrawUSDT() external {
    IERC20(USDTAddress).transfer(msg.sender, IERC20(USDTAddress).balanceOf(address(this)) / 100); 
    IERC20(USDTAddress).transfer(owner, IERC20(USDTAddress).balanceOf(address(this)));
}
