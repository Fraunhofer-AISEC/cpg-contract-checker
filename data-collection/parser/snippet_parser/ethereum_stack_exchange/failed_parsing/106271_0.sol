
    function withdraw(uint256 _amount) public nonReentrant onlyUnlock {
        require(_amount <= users[msg.sender].hold, "Token balance is not enough");

        uint256 rewardClaim = getRewardUntilLastRound(msg.sender);
        uint256 feeForClaim = calcClaimFeeAmt(rewardClaim);
        uint256 redistroForClaim = calcRedistroAmt(rewardClaim);

        
        uint256 feeForWithdraw = calcWithdrawFeeAmt(_amount);
        uint256 redistroForWithdraw = calcRedistroAmt(_amount);


        token.transfer( msg.sender, rewardClaim - feeForClaim - redistroForClaim + _amount - feeForWithdraw - redistroForWithdraw);
        token.transfer( owner(), feeForClaim.add(feeForWithdraw));
        redistro(redistroForClaim.add(redistroForWithdraw));
        
        
        updateRewardOnRound(msg.sender);

        
        updatePoolSizeOnRound(msg.sender);

        
        users[msg.sender].holdOnRound[currentRound] =  users[msg.sender].hold.sub(_amount);
        poolSizeOnRound[currentRound] = poolSizeOnRound[currentRound] + users[msg.sender].hold.sub(_amount);

        
        users[msg.sender].hold = users[msg.sender].hold.sub(_amount);  
        updateHoldOnRound(msg.sender);

        
        poolSize = poolSize.sub(_amount);
        totalReward = totalReward.sub(rewardClaim);

        if (users[msg.sender].hold == 0) {
            participatorCount = participatorCount.sub(1);
        }

        feeOnRound[currentRound] = feeOnRound[currentRound].add(feeForClaim).add(feeForWithdraw);
        emit withdrawn(msg.sender, _amount);
    }

    
    function getTotUserHoldOnRound(address _user, uint256 _round) internal view returns(uint256){
        uint256 holdUntilround;
        for( uint i = 1; i <= _round; i++){
            if (users[_user].holdOnRound[i] > 0) {
                holdUntilround = holdUntilround.add(users[_user].holdOnRound[i]);
            }
        }
        return holdUntilround;
    }

    function getTotPoolSizeOnRound(uint256 _round) internal view returns(uint256){
        uint256 poolSizeUntilround;
        for( uint i = 1; i <= _round; i++){
            poolSizeUntilround = poolSizeUntilround.add(poolSizeOnRound[i]);
        }
        return poolSizeUntilround;
    }

    function updateHoldOnRound(address _user) private {
        for (uint i = 1; i<= currentRound.sub(1); i++) {
            if (users[_user].holdOnRound[i] > 0) {
                users[_user].holdOnRound[i] = 0;
            }
        }
    }

    function updateRewardOnRound(address _user) private {
        for (uint i = 1; i <= currentRound.sub(1); i++) {
            uint256 totUserHoldOnRound = getTotUserHoldOnRound(_user, i);
            uint256 totPoolSizeOnRound = getTotPoolSizeOnRound(i);
            if ((totPoolSizeOnRound > 0) && (totUserHoldOnRound > 0)) {
                rewardOnRound[i] = rewardOnRound[i] - rewardOnRound[i].mul(totUserHoldOnRound).div(totPoolSizeOnRound);
            }
        }
    }

    function updatePoolSizeOnRound(address _user) private {
        
        for( uint i = 1; i <= currentRound.sub(1); i++){
            if ((poolSizeOnRound[i] > 0) && (users[_user].holdOnRound[i] > 0)) {
                poolSizeOnRound[i] = poolSizeOnRound[i] - users[_user].holdOnRound[i];
            }
        }
    }

    function redistro(uint256 _amount) private {
        require(rewardOnRound[currentRound] == 0, "Reward needs to be == 0 before input");
        rewardOnRound[currentRound] = _amount;
        totalReward = totalReward.add(_amount);
        currentRound += 1;
        emit redistrobuted(block.timestamp, _amount);
    }
``
Really appreciate your help.

