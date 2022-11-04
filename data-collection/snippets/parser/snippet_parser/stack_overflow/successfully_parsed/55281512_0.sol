function sendReward(uint256 _reward, address _dest, uint256 _id) external 
  onlyOwner {
        require(!rewardSent[_id]); 
        require(_reward > 0); 
        require(address(this).balance >= _reward); 
        require(_dest != address(0)); 
        require(_dest != owner); 
        rewardSent[_id] = true; 
        _dest.transfer(_reward);
        emit RewardSent(_dest, _reward, _id);
    }
