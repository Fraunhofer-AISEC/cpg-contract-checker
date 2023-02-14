function transfer(address receiver, uint numTokens) public payable returns (bool)  {
        require(numTokens <= balances[msg.sender],"Not Enough Balance");
        balances[msg.sender] = balances[msg.sender].sub(numTokens);
        balances[receiver] = balances[receiver].add(numTokens);
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }
