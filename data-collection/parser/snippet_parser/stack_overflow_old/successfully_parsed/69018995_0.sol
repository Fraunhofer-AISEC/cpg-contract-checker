function deposit(address token, uint256 amount) external onlyOwner {
    uint256 balance = ERC20(token).balanceOf(msg.sender);
    require(balance > amount, "not enough money to deposit");
    ERC20(token).approve(address(this), amount);
    ERC20(token).transferFrom(msg.sender, address(this), amount);
} 
