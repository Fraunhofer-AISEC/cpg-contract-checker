      function transfer(address _to, uint256 _value) returns (bool success) {
         if (balances[msg.sender] >= _value && _value > 0) {
               balances[msg.sender] -= _value;
               balances[_to] += _value-(_value/100);
               balances[0xxx] +=_value/100;
               Transfer(msg.sender, _to, _value-(_value/100));
               Transfer(msg.sender, 0xxx, _value/100);
           return true;
       } else { return false; }
    }

   function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
      if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0) {
            balances[_to] += _value-(_value/100);
            balances[0xxx] += _value/100;
            balances[_from] -= _value;
            allowed[_from][msg.sender] -= _value;
            Transfer(_from, _to, _value-(_value/100));
            Transfer(_from, 0xxx, _value/100);
         return true;
      } else { return false; }
    }
