function transfer(address _to, uint256 _value) public returns (bool success) {
    require(balances[msg.sender] >= _value);

    require(!locked || (msg.sender == owner));

    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    return true;
}
