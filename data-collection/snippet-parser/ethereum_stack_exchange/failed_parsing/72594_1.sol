        balances[msg.sender] = balances[msg.sender].add(tokens);
        emit Transfer(address(this), msg.sender, tokens);
        totalSupply_ = totalSupply_.add(tokens);
        owner.transfer(weiAmount);
    }
