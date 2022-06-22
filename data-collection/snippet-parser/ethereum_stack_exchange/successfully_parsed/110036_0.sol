uint256 totalBalance = 111;
uint256 rewardPerDay = 1000;

function calculateReward(uint256 userBalance) public view returns (uint256) {
    
    uint256 poolShare = userBalance * 1000 / totalBalance;
    uint256 reward = poolShare * rewardPerDay / (1000);
    return reward;

}
