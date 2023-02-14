balances[teamWallet] = 3000 ether;
        emit Transfer(address(0x0), teamWallet, (3000 ether));
        frozenBalances[teamWallet] = 3000 ether;
        timelock[teamWallet] = teamReleaseTime;
