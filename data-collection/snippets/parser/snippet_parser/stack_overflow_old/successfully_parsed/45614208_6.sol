function deposit() public payable returns (uint) {
      balances[msg.sender] += msg.value;
      Transfer(msg.sender, msg.value); 
      return balances[msg.sender];
   }
