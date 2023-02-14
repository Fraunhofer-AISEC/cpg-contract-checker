balances[msg.sender] = INITIAL_SUPPLY;
emit Transfer(address(0), msg.sender, INITIAL_SUPPLY);
