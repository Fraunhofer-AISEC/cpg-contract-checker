
address public SMART_CHEF_FACTORY;


bool public hasUserLimit;


bool public isInitialized;


uint256 public accTokenPerShare;


uint256 public bonusEndBlock;


uint256 public startBlock;


uint256 public lastRewardBlock;


uint256 public poolLimitPerUser;


uint256 public rewardPerBlock;


uint256 public PRECISION_FACTOR;


IBEP20 public rewardToken;


IBEP20 public stakedToken;


mapping(address => UserInfo) public userInfo;

struct UserInfo {
    uint256 amount; 
    uint256 rewardDebt; 
}

event AdminTokenRecovery(address tokenRecovered, uint256 amount);
event Deposit(address indexed user, uint256 amount);
event EmergencyWithdraw(address indexed user, uint256 amount);
event NewStartAndEndBlocks(uint256 startBlock, uint256 endBlock);
event NewRewardPerBlock(uint256 rewardPerBlock);
event NewPoolLimit(uint256 poolLimitPerUser);
event RewardsStop(uint256 blockNumber);
event Withdraw(address indexed user, uint256 amount);

constructor() public {
    SMART_CHEF_FACTORY = msg.sender;
}


function initialize(
    IBEP20 _stakedToken,
    IBEP20 _rewardToken,
    uint256 _rewardPerBlock,
    uint256 _startBlock,
    uint256 _bonusEndBlock,
    uint256 _poolLimitPerUser,
    address _admin
) external {
    require(!isInitialized, "Already initialized");
    require(msg.sender == SMART_CHEF_FACTORY, "Not factory");

    
    isInitialized = true;

    stakedToken = _stakedToken;
    rewardToken = _rewardToken;
    rewardPerBlock = _rewardPerBlock;
    startBlock = _startBlock;
    bonusEndBlock = _bonusEndBlock;

    if (_poolLimitPerUser > 0) {
        hasUserLimit = true;
        poolLimitPerUser = _poolLimitPerUser;
    }

    uint256 decimalsRewardToken = uint256(rewardToken.decimals());
    require(decimalsRewardToken < 30, "Must be inferior to 30");

    PRECISION_FACTOR = uint256(10**(uint256(30).sub(decimalsRewardToken)));

    
    lastRewardBlock = startBlock;

    
    transferOwnership(_admin);
}


function deposit(uint256 _amount) external nonReentrant {
    UserInfo storage user = userInfo[msg.sender];

    if (hasUserLimit) {
        require(_amount.add(user.amount) <= poolLimitPerUser, "User amount above limit");
    }

    _updatePool();

    if (user.amount > 0) {
        uint256 pending = user.amount.mul(accTokenPerShare).div(PRECISION_FACTOR).sub(user.rewardDebt);
        if (pending > 0) {
            rewardToken.safeTransfer(address(msg.sender), pending);
        }
    }

    if (_amount > 0) {
        user.amount = user.amount.add(_amount);
        stakedToken.safeTransferFrom(address(msg.sender), address(this), _amount);
    }

    user.rewardDebt = user.amount.mul(accTokenPerShare).div(PRECISION_FACTOR);

    emit Deposit(msg.sender, _amount);
}


function withdraw(uint256 _amount) external nonReentrant {
    UserInfo storage user = userInfo[msg.sender];
    require(user.amount >= _amount, "Amount to withdraw too high");

    _updatePool();

    uint256 pending = user.amount.mul(accTokenPerShare).div(PRECISION_FACTOR).sub(user.rewardDebt);

    if (_amount > 0) {
        user.amount = user.amount.sub(_amount);
        stakedToken.safeTransfer(address(msg.sender), _amount);
    }

    if (pending > 0) {
        rewardToken.safeTransfer(address(msg.sender), pending);
    }

    user.rewardDebt = user.amount.mul(accTokenPerShare).div(PRECISION_FACTOR);

    emit Withdraw(msg.sender, _amount);
}


function emergencyWithdraw() external nonReentrant {
    UserInfo storage user = userInfo[msg.sender];
    uint256 amountToTransfer = user.amount;
    user.amount = 0;
    user.rewardDebt = 0;

    if (amountToTransfer > 0) {
        stakedToken.safeTransfer(address(msg.sender), amountToTransfer);
    }

    emit EmergencyWithdraw(msg.sender, user.amount);
}


function emergencyRewardWithdraw(uint256 _amount) external onlyOwner {
    rewardToken.safeTransfer(address(msg.sender), _amount);
}


function recoverWrongTokens(address _tokenAddress, uint256 _tokenAmount) external onlyOwner {
    require(_tokenAddress != address(stakedToken), "Cannot be staked token");
    require(_tokenAddress != address(rewardToken), "Cannot be reward token");

    IBEP20(_tokenAddress).safeTransfer(address(msg.sender), _tokenAmount);

    emit AdminTokenRecovery(_tokenAddress, _tokenAmount);
}


function stopReward() external onlyOwner {
    bonusEndBlock = block.number;
}


function updatePoolLimitPerUser(bool _hasUserLimit, uint256 _poolLimitPerUser) external onlyOwner {
    require(hasUserLimit, "Must be set");
    if (_hasUserLimit) {
        require(_poolLimitPerUser > poolLimitPerUser, "New limit must be higher");
        poolLimitPerUser = _poolLimitPerUser;
    } else {
        hasUserLimit = _hasUserLimit;
        poolLimitPerUser = 0;
    }
    emit NewPoolLimit(poolLimitPerUser);
}


function updateRewardPerBlock(uint256 _rewardPerBlock) external onlyOwner {
    require(block.number < startBlock, "Pool has started");
    rewardPerBlock = _rewardPerBlock;
    emit NewRewardPerBlock(_rewardPerBlock);
}


function updateStartAndEndBlocks(uint256 _startBlock, uint256 _bonusEndBlock) external onlyOwner {
    require(block.number < startBlock, "Pool has started");
    require(_startBlock < _bonusEndBlock, "New startBlock must be lower than new endBlock");
    require(block.number < _startBlock, "New startBlock must be higher than current block");

    startBlock = _startBlock;
    bonusEndBlock = _bonusEndBlock;

    
    lastRewardBlock = startBlock;

    emit NewStartAndEndBlocks(_startBlock, _bonusEndBlock);
}


function pendingReward(address _user) external view returns (uint256) {
    UserInfo storage user = userInfo[_user];
    uint256 stakedTokenSupply = stakedToken.balanceOf(address(this));
    if (block.number > lastRewardBlock && stakedTokenSupply != 0) {
        uint256 multiplier = _getMultiplier(lastRewardBlock, block.number);
        uint256 SELFReward = multiplier.mul(rewardPerBlock);
        uint256 adjustedTokenPerShare =
            accTokenPerShare.add(SELFReward.mul(PRECISION_FACTOR).div(stakedTokenSupply));
        return user.amount.mul(adjustedTokenPerShare).div(PRECISION_FACTOR).sub(user.rewardDebt);
    } else {
        return user.amount.mul(accTokenPerShare).div(PRECISION_FACTOR).sub(user.rewardDebt);
    }
}


function _updatePool() internal {
    if (block.number <= lastRewardBlock) {
        return;
    }

    uint256 stakedTokenSupply = stakedToken.balanceOf(address(this));

    if (stakedTokenSupply == 0) {
        lastRewardBlock = block.number;
        return;
    }

    uint256 multiplier = _getMultiplier(lastRewardBlock, block.number);
    uint256 SELFReward = multiplier.mul(rewardPerBlock);
    accTokenPerShare = accTokenPerShare.add(SELFReward.mul(PRECISION_FACTOR).div(stakedTokenSupply));
    lastRewardBlock = block.number;
}


function _getMultiplier(uint256 _from, uint256 _to) internal view returns (uint256) {
    if (_to <= bonusEndBlock) {
        return _to.sub(_from);
    } else if (_from >= bonusEndBlock) {
        return 0;
    } else {
        return bonusEndBlock.sub(_from);
    }
}
