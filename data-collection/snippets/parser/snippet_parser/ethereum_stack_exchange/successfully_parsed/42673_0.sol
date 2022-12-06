function transfer(address _to, uint256 _value) public returns (bool success) {
    require(
        balances[msg.sender] >= _value
        && _value > 0
    );
    if(locked == true){
        if(msg.sender == owner){
            balances[msg.sender] = balances[msg.sender].sub(_value);
            balances[_to] = balances[_to].add(_value);
            emit Transfer(msg.sender, _to, _value);
            return true;
        }else{
            revert();
        }
    }else{
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}
