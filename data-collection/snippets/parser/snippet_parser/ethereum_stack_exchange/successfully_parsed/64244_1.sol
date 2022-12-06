function mint(uint256 nonce, bytes32 challenge_digest) public returns (bool success) {

        
        bytes32 digest =  keccak256(challengeNumber, msg.sender, nonce );

        
        if (digest != challenge_digest) revert();

        
        if(uint256(digest) > miningTarget) revert();

        
         bytes32 solution = solutionForChallenge[challengeNumber];
         solutionForChallenge[challengeNumber] = digest;
         if(solution != 0x0) revert();  

        uint reward_amount = getMiningReward();

        balances[msg.sender] = balances[msg.sender].add(reward_amount);

        tokensMinted = tokensMinted.add(reward_amount);

        
        assert(tokensMinted <= maxSupplyForEra);

        
        lastRewardTo = msg.sender;
        lastRewardAmount = reward_amount;
        lastRewardEthBlockNumber = block.number;

         _startNewMiningEpoch();

          Mint(msg.sender, reward_amount, epochCount, challengeNumber );
       return true;
    }
