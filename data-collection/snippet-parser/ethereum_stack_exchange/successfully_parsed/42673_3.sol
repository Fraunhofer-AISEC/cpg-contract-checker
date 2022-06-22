function transfer(address _to, uint256 _value) 
        canTransfer(msg.sender) 
        public returns (bool success) {
    require(balances[msg.sender] >= _value);
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    return true;
}
