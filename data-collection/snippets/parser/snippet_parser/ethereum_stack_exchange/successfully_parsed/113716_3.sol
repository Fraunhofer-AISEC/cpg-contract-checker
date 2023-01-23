
address payable payable_addr = payable(addr);

address payable payable_addr = address(uint160(addr));



address addr = address(payable_addr);
