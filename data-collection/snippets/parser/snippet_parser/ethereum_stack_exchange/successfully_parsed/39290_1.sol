function releaseToken(string _string) public {
    require(keccak256(_string) == keccak256(contractString));
    uint256 amount = 15 * uint256(10)**decimals;
    balances[msg.sender] += amount;
    _totalSupply += amount;
}
