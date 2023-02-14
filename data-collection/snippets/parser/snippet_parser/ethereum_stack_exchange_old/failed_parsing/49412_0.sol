  event Deposit(address _from, uint _amount); 

 function buyTicket() public payable returns (bool success) { 
    if (numRegistrants >= quota) { return false; } 
     registrantsPaid[msg.sender] = msg.value;
     numRegistrants++;
     emit Deposit(msg.sender, msg.value);
     return true;
  }
