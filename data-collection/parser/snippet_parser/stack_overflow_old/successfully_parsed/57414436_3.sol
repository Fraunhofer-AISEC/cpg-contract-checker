function balanceOf(address accountAddress) public view returns (uint256) {
    return balances[accountAddress];
}
