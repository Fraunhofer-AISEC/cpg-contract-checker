contract test {
mapping(address => uint256) balances;

function deposit(uint256 amount) external payable {
    balances[msg.sender] += amount;
}

function withdraw() external {
    uint256 amount = balances[msg.sender];
    balances[msg.sender] = 0;
    (bool success, ) = msg.sender.call{value: amount}("");
    require(success, "Transfer failed.");
}

function balanceOf(address account) public view virtual returns (uint256) {
    return balances[account];
}
}
