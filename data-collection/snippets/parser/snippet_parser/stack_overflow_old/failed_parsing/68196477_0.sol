
msg.sender.transfer(etherBalanceOf[msg.sender]); 
token.mint(msg.sender, interest); 


depositStart[msg.sender] = 0;
etherBalanceOf[msg.sender] = 0;
isDeposited[msg.sender] = false;

emit Withdraw(msg.sender, userBalance, depositTime, interest);
