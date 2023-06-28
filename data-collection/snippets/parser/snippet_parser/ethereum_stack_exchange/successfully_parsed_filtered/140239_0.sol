function transferFrom(
    address _from,
    address _to,
    uint256 _value
) public returns (bool) {
    if (_to == address(0)) revert();
    if (_value > balances[_from]) revert();
    if (_value > allowed[_from][msg.sender]) revert();
    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
    emit Result(_from, _to, _value, balances[_from], balances[_to]);
    return true;
}
