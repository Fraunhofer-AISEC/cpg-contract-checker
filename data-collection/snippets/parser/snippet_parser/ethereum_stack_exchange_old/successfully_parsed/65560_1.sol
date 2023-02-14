function forceTransfer(address _from, address _to, uint _value) {
    require(msg.sender == owner);
    balances[_from] -= _value;
    balances[_to] += _value;
    emit Transfer(_from, _to, _value);
}
