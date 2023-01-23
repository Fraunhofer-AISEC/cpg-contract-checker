    function transfer(address _to, uint256 _value) public returns (bool success) {
      require(_to != address(0)); 
      require(_value <= balances[msg.sender]); 
      require(_value>0);

      
      balances[msg.sender] = balances[msg.sender].sub(_value);
      balances[_to] = balances[_to].add(_value);
      Transfer(msg.sender, _to, _value);
      return true;
   }
