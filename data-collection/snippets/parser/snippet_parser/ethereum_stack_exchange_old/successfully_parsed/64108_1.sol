address addr1 = msg.sender;
address payable addr2 = addr1; 
address payable addr3 = address(uint160(addr1)); 
address payable addr4 = payable(addr1); 
