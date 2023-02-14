function buyTokens() payable {
    require(msg.value > 0);

    uint256 _numTokens = msg.value.mul(RATE);

    require(balances[owner] >= _numTokens);

    balances[owner] = balances[owner].sub(_numTokens);
    balances[msg.sender] = balances[msg.sender].add(_numTokens);
    Transfer(owner, msg.sender, _numTokens);

    owner.transfer(msg.value);
}
