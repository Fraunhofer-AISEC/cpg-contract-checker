function transfer(address _recipient, uint _value) public onlyPayloadSize(2*32) {
    require(balances[msg.sender] >= _value && _value > 0);
    balances[msg.sender].sub(_value);
    balances[_recipient].add(_value);
    emit Transfer(msg.sender, _recipient, _value);        
    }
