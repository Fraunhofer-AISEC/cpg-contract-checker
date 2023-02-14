event Withdrawal(address indexed to, uint256 amount);
event Deposit(address indexed from, uint256 amount);

constructor(address tokenAddress) payable {
    token = IERC20(tokenAddress);
    owner = payable(msg.sender);
}

receive() external payable {
        token.balanceOf[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
}

function totalBalance() external view returns (uint256) {
    return token.balanceOf(address(this));
}

function withdraw(uint withdrawalAmount) public {
    require(token.balanceOf[msg.sender] >= withdrawalAmount);
    token.balanceOf[msg.sender] -= withdrawalAmount;
    msg.sender.transfer(withdrawalAmount);
    Withdrawal(msg.sender, withdrawalAmount);}
