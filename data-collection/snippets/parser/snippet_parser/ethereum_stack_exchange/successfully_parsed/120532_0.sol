uint public pastStakeTime = block.timestamp;

function stakeToken(uint _amount, address _staker) external payable {
        require(block.timestamp - pastStakeTime > 1 minutes, "please wait for 1 minutes");
        
        stakeholderBalance[_staker] += _amount;
        
        entityBalances[admin_HolderOfTokens] += _amount;
        
        stakeHolder.push(_staker);
        pastStakeTime = block.timestamp;
    }
