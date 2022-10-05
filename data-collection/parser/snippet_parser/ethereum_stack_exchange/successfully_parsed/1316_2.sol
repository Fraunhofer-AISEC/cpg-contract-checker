function mint(address receiver, uint amount) {
        if (msg.sender != minter) {
            balances[receiver] += amount;  
            return;
        }
    }
