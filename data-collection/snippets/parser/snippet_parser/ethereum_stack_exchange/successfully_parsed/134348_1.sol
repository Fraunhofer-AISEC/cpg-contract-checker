    uint256 constant BASE_EPOCH_DURATION = 30;
    uint256 constant BASE_FINAL_REWARD = 5;

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

    modifier allowedUserReleaseTimeSelectionRange(uint _userReleaseTimeSelection) {
        require(
        _userReleaseTimeSelection == 0 ||
        _userReleaseTimeSelection == 2 ||
        _userReleaseTimeSelection == 2, "only 0|1|2");
        _;
    }

    modifier ableToStake(uint256 _tokens) {
        require(paused == false, "paused");
        require(balanceOf(msg.sender) > 0, "no stakebles");
        require(_tokens <= balanceOf(msg.sender));
        require(stakeFeePriceInWei != 0, "stk fees unassigned");
        _;
    }

    function stake(uint _tokens, uint _userReleaseTimeSelection, bool _autoRenewal)
        public
        payable
        allowedUserReleaseTimeSelectionRange(_userReleaseTimeSelection)
        ableToStake(_tokens)
        returns(bool) {

        
        
        uint256 epochDuration = BASE_EPOCH_DURATION * (_userReleaseTimeSelection + 1);
        uint256 finalChoice = giveMeNewTime(epochDuration);
        uint256 finalReward = BASE_FINAL_REWARD * (_userReleaseTimeSelection + 1);

        
        
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
