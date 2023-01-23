uint256 balance = balances[msg.sender];
balances[msg.sender] = 0; 
msg.sender.transfer(balance); 
