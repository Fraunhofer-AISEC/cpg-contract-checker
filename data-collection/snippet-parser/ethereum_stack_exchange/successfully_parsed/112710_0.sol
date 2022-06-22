mapping (address => uint256) private balances;

function set(address user, uint256 balance) public returns (bool) {
    balances[user] = balance;
}

function get(address user) public view returns (uint256) {
    return balances[user];
}
