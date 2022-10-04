function getUserinfo () public view returns (uint, uint) {
 return (USERS[msg.sender].totalDeposits, USERS[msg.sender].totalInvested); 
 }
