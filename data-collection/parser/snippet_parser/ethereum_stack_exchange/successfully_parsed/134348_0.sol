mapping(address => AllUserStakedTimestamp) internal allUserStakes;

struct AllUserStakedTimestamp {
    bool[] _wasUnstaked;
    bool[] _autoRenewal;
    uint[] _amountStaked;
    uint[] _timeOfStake;
    uint[] _timesOfRelease;
    uint[] _optionReleaseSelected; 
    uint[] _epochDuration;
    uint[] _rewardPerCycle;
    uint[] _finalStakeReward;
}

function stake(uint _tokens, uint _userReleaseTimeSelection, bool _autoRenewal) public payable returns(bool){
    require(paused == false, "paused");
    require(balanceOf(msg.sender) > 0, "no stakebles");
    require(_tokens <= balanceOf(msg.sender));
    require(stakeFeePriceInWei != 0, "stk fees unassigned");
    
    uint epochDuration; 
    uint finalChoice; 
    uint finalReward;
    if(_userReleaseTimeSelection == 0) { 
        epochDuration = 30;
        finalChoice = giveMeNewTime(epochDuration); 
        finalReward = 5;
        allUserStakes[msg.sender]._wasUnstaked.push(false);
        allUserStakes[msg.sender]._autoRenewal.push(_autoRenewal);
        allUserStakes[msg.sender]._amountStaked.push(_tokens);
        allUserStakes[msg.sender]._timeOfStake.push(block.timestamp);
        allUserStakes[msg.sender]._timesOfRelease.push(finalChoice);
        allUserStakes[msg.sender]._optionReleaseSelected.push(_userReleaseTimeSelection);
        allUserStakes[msg.sender]._epochDuration.push(epochDuration);
        allUserStakes[msg.sender]._rewardPerCycle.push(finalReward);
        allUserStakes[msg.sender]._finalStakeReward.push(finalReward);
        burn(msg.sender, _tokens);
        return true;
        }
    else if(_userReleaseTimeSelection == 1) {
        epochDuration = 60;
        finalChoice = giveMeNewTime(epochDuration); 
        finalReward = 10;
        allUserStakes[msg.sender]._wasUnstaked.push(false);
        allUserStakes[msg.sender]._autoRenewal.push(_autoRenewal);
        allUserStakes[msg.sender]._amountStaked.push(_tokens);
        allUserStakes[msg.sender]._timeOfStake.push(block.timestamp);
        allUserStakes[msg.sender]._timesOfRelease.push(finalChoice);
        allUserStakes[msg.sender]._optionReleaseSelected.push(_userReleaseTimeSelection);
        allUserStakes[msg.sender]._epochDuration.push(epochDuration);
        allUserStakes[msg.sender]._rewardPerCycle.push(finalReward);
        allUserStakes[msg.sender]._finalStakeReward.push(finalReward);
        burn(msg.sender, _tokens);
        return true;
        }
    else if(_userReleaseTimeSelection == 2) {
        epochDuration = 90;
        finalChoice = giveMeNewTime(epochDuration); 
        finalReward = 15;
        allUserStakes[msg.sender]._wasUnstaked.push(false);
        allUserStakes[msg.sender]._autoRenewal.push(_autoRenewal);
        allUserStakes[msg.sender]._amountStaked.push(_tokens);
        allUserStakes[msg.sender]._timeOfStake.push(block.timestamp);
        allUserStakes[msg.sender]._timesOfRelease.push(finalChoice);

        allUserStakes[msg.sender]._optionReleaseSelected.push(_userReleaseTimeSelection);
        allUserStakes[msg.sender]._epochDuration.push(epochDuration);
        allUserStakes[msg.sender]._rewardPerCycle.push(finalReward);
        allUserStakes[msg.sender]._finalStakeReward.push(finalReward);    
        burn(msg.sender, _tokens);
        return true;
        }
    else {revert("only 1|2|3");}
    }
