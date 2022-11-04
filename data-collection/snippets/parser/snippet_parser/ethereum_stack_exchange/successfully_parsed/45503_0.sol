  uint256 public rewardAmount = 40;

  function adjustReward (uint256 reward) onlyOwner public {
    rewardAmount = reward; 
  }
