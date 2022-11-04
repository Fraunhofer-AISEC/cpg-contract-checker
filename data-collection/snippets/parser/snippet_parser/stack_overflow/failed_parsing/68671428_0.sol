
uint depositTime = block.timestamp - depositStart[msg.sender];


**




uint interestPerSecond = 31668017 * (etherBalanceOf[msg.sender] / 1e16);
uint interest = interestPerSecond * depositTime;**



msg.sender.transfer(etherBalanceOf[msg.sender]); 
token.mint(msg.sender, interest); 
