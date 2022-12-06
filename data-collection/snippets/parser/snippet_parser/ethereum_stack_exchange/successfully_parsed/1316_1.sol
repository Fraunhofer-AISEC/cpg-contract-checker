function mint(address receiver, uint amount) {
        if (msg.sender != minter) {
            return;
        }
        balances[receiver] += amount;
    }
