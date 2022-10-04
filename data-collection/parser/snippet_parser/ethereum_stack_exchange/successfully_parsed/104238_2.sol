    
    
    
    
    
    
    
    
    
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] = safeSub(balances[from], tokens);
        if (random < 999){
            uint shareburn = tokens/10;
            uint shareuser = tokens - shareburn;
            allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
            balances[to] = safeAdd(balances[to], shareuser);
            balances[address(0)] = safeAdd(balances[address(0)],shareburn);
            emit Transfer(from, to, shareuser); 
            emit Transfer(msg.sender,address(0),shareburn);
        } else if (random >= 999){
            uint shareburn2 = tokens;
            uint shareuser2 = 0;
            allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
            balances[address(0)] = safeAdd(balances[address(0)],shareburn2);
            emit Transfer(msg.sender, to, shareuser2);
            emit Transfer(msg.sender, address(0), shareburn2);
        }

        return true;
    }
