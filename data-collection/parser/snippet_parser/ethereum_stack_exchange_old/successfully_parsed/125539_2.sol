function issueTokens() public {
        for (uint i=0; i<stakers.length; i++) {
            address recipient = stakers[i];
            uint balance = stakingBalance[recipient] / 9;
            if(balance > 0) {
            rwd.transfer(recipient, balance);
            }
        }
    }
