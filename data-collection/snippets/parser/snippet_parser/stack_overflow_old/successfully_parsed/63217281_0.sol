pragma solidity ^0.8.1;

contract StakingContract {
    struct Stake {
        address user;
        uint256 amount;
        uint64 sinceBlock;
        uint64 untilBlock;
    }

    Stake[] stakes;
    uint256 constant public percentPerBlock = 1; 

    event LogPayout(address user, uint256 stakedAmount, uint256 rewardAmount);

    function stake(uint256 _amount) external returns (uint256 stakeId) {
        stakes.push(Stake(msg.sender, _amount, uint64(block.timestamp), 0));
        return stakes.length - 1;
    }

    function unstake (uint256 _id) external {
        require(stakes[_id].user == msg.sender, 'Not your stake');
        require(stakes[_id].untilBlock == 0, 'Already unstaked');

        stakes[_id].untilBlock = uint64(block.timestamp);

        uint256 stakedForBlocks = (block.timestamp - stakes[_id].sinceBlock);
        uint256 rewardAmount = stakes[_id].amount * stakedForBlocks * percentPerBlock / 100;

        emit LogPayout(stakes[_id].user, stakes[_id].amount, rewardAmount);
        
    }
    
    function viewUserTotalUnclaimedRewards(address _user) external view returns (uint256) {
        uint256 totalUnclaimedRewards;

        for(uint256 i = 0; i < stakes.length; i++) {
            if (stakes[i].user == _user && stakes[i].untilBlock == 0) {
                uint256 stakedForBlocks = (block.timestamp - stakes[i].sinceBlock);
                uint256 rewardAmount = stakedForBlocks * percentPerBlock / 100;
                totalUnclaimedRewards += rewardAmount;
            }
        }

        return totalUnclaimedRewards;
    }
}
