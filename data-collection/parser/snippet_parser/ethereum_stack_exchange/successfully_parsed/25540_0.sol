
function makeTransfer(address token, address myAccount, uint256 amount) public {
    ERC20(token).transferFrom(myAccount, address(this), amount);
}
