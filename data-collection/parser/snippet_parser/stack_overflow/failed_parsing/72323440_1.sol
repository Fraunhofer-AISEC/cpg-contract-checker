    error TransferFailed();
    error NeedsMoreThanZero();
    
    contract Staking is ReentrancyGuard {
        IERC20 public s_rewardsToken;
        IERC20 public s_stakingToken;
    
        

nd
    
    
    
    uint256 public constant REWARD_RATE = 100;
    uint256 public s_lastUpdateTime;
    uint256 public s_rewardPerTokenStored;
    
    uint256 public initialTime;
    uint256 public T;

    mapping(address => uint256) public s_userRewardPerTokenPaid;
    mapping(address => uint256) public s_rewards;

    uint256 private s_totalSupply;
    mapping(address => uint256) public s_balances; 

    event Staked(address indexed user, uint256 indexed amount);
    event WithdrewStake(address indexed user, uint256 indexed amount);
    event RewardsClaimed(address indexed user, uint256 indexed amount);

    constructor(address stakingToken, address rewardsToken, uint256 timeConstant) {
        s_stakingToken = IERC20(stakingToken);
        s_rewardsToken = IERC20(rewardsToken);
        initialTime = block.timestamp;
        T = timeConstant;
    }

    
    function rewardPerToken() public view returns (uint256) {
        if (s_totalSupply == 0) {
            return s_rewardPerTokenStored;
        }
        return
            s_rewardPerTokenStored +
            (((block.timestamp - s_lastUpdateTime) * REWARD_RATE * 1e18) / s_totalSupply);
    }

    
    function earned(address account) public view returns (uint256) {
        uint256 nowTime = block.timestamp-initialTime;
        require(nowTime > 2*T);
        if (nowTime > 2*T && nowTime <= 3*T) {
                return
            ((((s_balances[account] * (rewardPerToken() - s_userRewardPerTokenPaid[account])) /
                1e18) + s_rewards[account]) / 5 );
        } else if
            (nowTime > 3*T && nowTime <= 4*T) {
                return
            ((((s_balances[account] * (rewardPerToken() - s_userRewardPerTokenPaid[account])) /
                1e18) + s_rewards[account]) / 2 );
        } else {
            return
            (((s_balances[account] * (rewardPerToken() - s_userRewardPerTokenPaid[account])) /
                1e18) + s_rewards[account]);
        }
        
    }

    
    function stake(uint256 amount)
        external
        updateReward(msg.sender)
        nonReentrant
        moreThanZero(amount)
    {
        
        uint256 nowTime = block.timestamp-initialTime; 
        require(nowTime < T);
        s_totalSupply += amount; 
        
        s_balances[msg.sender] += amount; 
        emit Staked(msg.sender, amount);
        
        bool success = s_stakingToken.transferFrom(msg.sender, address(this), amount);  
        
        
        if (!success) {
            revert TransferFailed(); 
        }
    }

    
    function withdraw(uint256 amount) external updateReward(msg.sender) nonReentrant {
        
        uint256 nowTime = block.timestamp-initialTime; 
        require(nowTime > 2* T);
        s_totalSupply -= amount;
        s_balances[msg.sender] -= amount;
        emit WithdrewStake(msg.sender, amount);
        
        bool success = s_stakingToken.transfer(msg.sender, amount);
        if (!success) {
            revert TransferFailed(); 
        }
    }

    
    function claimReward() external updateReward(msg.sender) nonReentrant {
        uint256 reward = s_rewards[msg.sender];
        s_rewards[msg.sender] = 0;
        emit RewardsClaimed(msg.sender, reward);
        bool success = s_rewardsToken.transfer(msg.sender, reward);
        if (!success) {
            revert TransferFailed(); 
        }
    }

    
    
    
    modifier updateReward(address account) {
        s_rewardPerTokenStored = rewardPerToken();
        s_lastUpdateTime = block.timestamp;
        s_rewards[account] = earned(account);
        s_userRewardPerTokenPaid[account] = s_rewardPerTokenStored;
        _;
    }

    modifier moreThanZero(uint256 amount) {
        if (amount == 0) {
            revert NeedsMoreThanZero();
        }
        _;
    }

    
    
    
    
    

    function getStaked(address account) public view returns (uint256) {
        return s_balances[account];
    }
}
