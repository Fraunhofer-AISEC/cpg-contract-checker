function balanceOf(address _owner) public pure returns (uint256 balance) {
    return balances[_owner];
}
