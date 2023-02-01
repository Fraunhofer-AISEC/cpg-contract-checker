
    function stake(uint256 amount) public {
        require(amount > 0, "Stake amount must be > 0");
        uint256 stakerBSCMBalance = BSCMemepadContract.balanceOf(msg.sender);
        require(stakerBSCMBalance >= amount, "Caller balance < amount");
        Staker memory _staker = stakerInfo[msg.sender];
        if (!_staker.isPresent) {
            _staker.isPresent = true;
            stakers.push(msg.sender);
            
            _staker.stakedAt = block.timestamp;
        }

        
        if (_staker.isPresent && (_staker.stakedAt == 0) && (_staker.amount == 0)) {
            
            _staker.stakedAt = block.timestamp;
        }

        BSCMemepadContract.safeTransferFrom(msg.sender, address(this), amount);
        totalBSCMemepadStaked += amount;
        _staker.amount += amount;
        stakerInfo[msg.sender] = _staker; 
        emit Stake(msg.sender, amount, _staker.stakedAt);
    }

