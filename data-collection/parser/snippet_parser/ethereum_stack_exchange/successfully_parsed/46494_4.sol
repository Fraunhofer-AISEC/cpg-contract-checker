function end(address payer, address payee) onlyOwner external {
    uint value = balances[payer][payee];
     payee.transfer(value);  
  }
