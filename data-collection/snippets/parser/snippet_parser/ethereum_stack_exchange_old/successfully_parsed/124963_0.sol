contract Staking is Ownable {

struct User {
    uint256 depositAmount;
    uint256 paidReward;
    uint256 lockTime;
}

using SafeMath for uint256;

mapping (address => User) public users;

uint256 public rewardTillNowPerToken = 0;
uint256 public lastUpdatedBlock;
uint256 public rewardPerBlock;
uint256 public scale = 1e18;
uint public countUser;
uint256 public minDepositAng = 5;

uint256 public particleCollector = 0;

uint256 public allStaked;

StakedToken public stakedToken;
RewardToken public rewardToken;

event Deposit(address user, uint256 amount);
event Withdraw(address user, uint256 amount);
event EmergencyWithdraw(address user, uint256 amount);
event RewardClaimed(address user, uint256 amount);
event RewardPerBlockChanged(uint256 oldValue, uint256 newValue);

constructor (address _stakedToken, address _rewardToken, uint256 _rewardPerBlock) {
    stakedToken = StakedToken(_stakedToken);
    rewardToken = RewardToken(_rewardToken);
    rewardPerBlock = _rewardPerBlock / 10000;
    lastUpdatedBlock = block.number;
}

function setRewardPerBlock(uint256 _rewardPerBlock) public onlyOwner {
    update();
    emit RewardPerBlockChanged(rewardPerBlock, _rewardPerBlock);
    rewardPerBlock = _rewardPerBlock;
}

function update() public {
    if (block.number <= lastUpdatedBlock) {
        return;
    }
    uint256 updateRewardPerUser = rewardPerBlock + (countUser / 100000);
    uint256 totalStakedToken = stakedToken.balanceOf(address(this));
    uint256 rewardAmount = (block.number - lastUpdatedBlock).mul(updateRewardPerUser);

    rewardTillNowPerToken = rewardTillNowPerToken.add(rewardAmount.mul(scale).div(totalStakedToken));
    lastUpdatedBlock = block.number;
}

function pendingReward(address _user) external view returns (uint256) {
    User storage user = users[_user];
    uint256 accRewardPerToken = rewardTillNowPerToken;
    uint256 updateRewardPerUser = rewardPerBlock + (countUser / 100000);
    if (block.number > lastUpdatedBlock) {
        uint256 totalStakedToken = stakedToken.balanceOf(address(this));
        uint256 rewardAmount = (block.number - lastUpdatedBlock).mul(updateRewardPerUser);
        accRewardPerToken = accRewardPerToken.add(rewardAmount.mul(scale).div(totalStakedToken));
    }
    return user.depositAmount.mul(accRewardPerToken).div(scale).sub(user.paidReward);
}

function deposit(uint256 amount) public {
    require(minDepositAng >= amount, "Deposit fail, error: Not essential ANG token");
    User storage user = users[msg.sender];
    update();
   
    if (user.depositAmount > 0) {
        uint256 _pendingReward = user.depositAmount.mul(rewardTillNowPerToken).div(scale).sub(user.paidReward);
        rewardToken.transfer(msg.sender, _pendingReward);
        emit RewardClaimed(msg.sender, _pendingReward);
    }
    user.depositAmount = user.depositAmount.add(amount);
    user.paidReward = user.depositAmount.mul(rewardTillNowPerToken).div(scale);
    user.lockTime = block.timestamp.add(3 days);
    stakedToken.transferFrom(address(msg.sender), address(this), amount);
    emit Deposit(msg.sender, amount);
}

function withdraw(uint256 amount) public {
    User storage user = users[msg.sender];
    require(user.depositAmount >= amount, "withdraw amount exceeds deposited amount");
    
    update();
    countUser -= 1;
    uint256 _pendingReward = user.depositAmount.mul(rewardTillNowPerToken).div(scale).sub(user.paidReward);
    rewardToken.transfer(msg.sender, _pendingReward);
    emit RewardClaimed(msg.sender, _pendingReward);

    if (amount > 0) {
        allStaked = allStaked.sub(amount);
        user.depositAmount = user.depositAmount.sub(amount);
        stakedToken.transfer(address(msg.sender), amount);
        emit Withdraw(msg.sender, amount);
    }

    user.paidReward = user.depositAmount.mul(rewardTillNowPerToken).div(scale);
}

function emergencyWithdraw() public {
    User storage user = users[msg.sender];

    stakedToken.transfer(msg.sender, user.depositAmount);

    emit EmergencyWithdraw(msg.sender, user.depositAmount);

    user.depositAmount = 0;
    user.paidReward = 0;
}


function withdrawAllRewardTokens(address to) public onlyOwner {
    uint256 totalRewardTokens = rewardToken.balanceOf(address(this));
    rewardToken.transfer(to, totalRewardTokens);
}

function withdrawAllStakedtokens(address to) public onlyOwner {
    uint256 totalStakedTokens = stakedToken.balanceOf(address(this));
    stakedToken.transfer(to, totalStakedTokens);
}

}
