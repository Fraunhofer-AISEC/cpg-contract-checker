constructor(
        IBEP20 _syrup,
        uint256 _rewardPerBlock,
        uint256 _startBlock,
        uint256 _endBlock
    ) public {
        syrup = _syrup;
        rewardPerBlock = _rewardPerBlock;
        startBlock = _startBlock;
        bonusEndBlock = _endBlock;

        
        poolInfo = PoolInfo({
            lastRewardBlock: startBlock,
            accRewardPerShare: 0
        });
    }
