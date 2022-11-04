function getUserTokenBalance(address user) public view onlyAdmin returns (uint256) {
    return balance[user];
}
