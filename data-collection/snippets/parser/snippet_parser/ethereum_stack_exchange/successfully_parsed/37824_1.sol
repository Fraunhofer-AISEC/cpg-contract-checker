function createTokens() payable {
    require(msg.value > 0);

    uint256 tokens = msg.value.mul(RATE);
    balances[msg.sender] = balances[msg.sender].add(tokens);
    _totalSupply = _totalSupply.add(tokens);

    owner.transfer(msg.value);
}
