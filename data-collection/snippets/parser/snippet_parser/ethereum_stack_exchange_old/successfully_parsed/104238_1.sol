    
    
    
    
    
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = safeSub(balances[msg.sender], tokens);
        if (random < 999){
            random = random + 1;
            uint shareburn = tokens/10;
            uint shareuser = tokens - shareburn;
            balances[to] = safeAdd(balances[to], shareuser);
            balances[address(0)] = safeAdd(balances[address(0)],shareburn);
            emit Transfer(msg.sender, to, shareuser); 
            emit Transfer(msg.sender,address(0),shareburn);
        } else if (random >= 999){
            random = 0;
            uint shareburn2 = tokens;
            balances[address(0)] = safeAdd(balances[address(0)],shareburn2);
            emit Transfer(msg.sender, to, 0);
            emit Transfer(msg.sender,address(0),shareburn2);
        }
        return true;

    }
