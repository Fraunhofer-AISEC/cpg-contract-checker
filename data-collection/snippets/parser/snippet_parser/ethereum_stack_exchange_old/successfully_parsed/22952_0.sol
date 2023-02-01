function() is_live() payable {
        if (msg.value == 0) throw;
        if (isFinalized) throw;

        uint256 tokens = safeMult(msg.value, tokenExchangeRate);   
        uint256 checkedSupply = safeAdd(totalSupply, tokens);      

        if (maxCap < checkedSupply) throw;                         

        totalSupply = checkedSupply;                               
        balances[msg.sender] += tokens;                            
        MPYCreation(msg.sender, tokens);                           
    }
