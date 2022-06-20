function transfer(address _to, uint256 _value) returns (bool success) {
           require(balances[msg.sender] >= _value && _value > 0);
           balances[msg.sender] = balances[msg.sender].sub(_value);
           balances[_to] = balances[_to].add(_value);
           Transfer(msg.sender, _to, _value);
           return true;
       }
