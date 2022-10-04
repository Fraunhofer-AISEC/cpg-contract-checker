function () public payable {
    uint tokens;
    
    
    tokens = msg.value * 10;
    
    
    address tokenOwner;

    
    balances[msg.sender] = safeAdd(balances[msg.sender], tokens);
    _totalSupply = safeAdd(_totalSupply, tokens);
    emit Transfer(address(0), msg.sender, tokens);
    tokenOwner.transfer(msg.value);

    }
