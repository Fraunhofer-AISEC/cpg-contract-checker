
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract StakingPool {
    uint256 public constant MULTIPLIER = 1e18;

    IERC20 public immutable stakedToken;
    IERC20 public immutable rewardToken;

    uint256 public immutable stakingStartBlock;
    uint256 public immutable initialStakingRatio;
    uint256 public immutable progressiveStakingBlocks;

    struct InvestorInfo {
        uint256 depositedAmount;
        uint256 withdrawedAmount;
        uint256 claimedRewardIndex;
    }

    mapping(address => InvestorInfo) private investorInfo;
    uint256 private rewardIndex;
    uint256 private totalDepositedAmount;
    uint256 private totalWithdrawedAmount;

    constructor(
        address _stakedToken,
        address _rewardToken,
        uint256 _stakingStartBlock,
        uint256 _initialStakingRatio,
        uint256 _progressiveStakingBlocks
    ) {
        stakedToken = IERC20(_stakedToken);
        rewardToken = IERC20(_rewardToken);

        stakingStartBlock = _stakingStartBlock;
        initialStakingRatio = _initialStakingRatio;
        progressiveStakingBlocks = _progressiveStakingBlocks;
    }

    function deposit(uint256 amount) external {
        require(block.number < stakingStartBlock, "deposit phase has ended");

        stakedToken.transferFrom(msg.sender, address(this), amount);

        investorInfo[msg.sender].depositedAmount += amount;
        totalDepositedAmount += amount;
    }

    function withdraw(uint256 amount) external {
        require(
            block.number >= stakingStartBlock,
            "staking phase hasn't started"
        );

        _claim();

        require(amount <= stakeOf(msg.sender), "insufficient stake");

        investorInfo[msg.sender].withdrawedAmount += amount;
        totalWithdrawedAmount += amount;

        stakedToken.transfer(msg.sender, amount);
    }

    function updateRewards(uint256 rewards) external {
        require(
            block.number >= stakingStartBlock,
            "staking phase hasn't started"
        );

        rewardToken.transferFrom(msg.sender, address(this), rewards);

        rewardIndex += (rewards * MULTIPLIER) / totalStake();
    }

    function claim() external {
        require(
            block.number >= stakingStartBlock,
            "staking phase hasn't started"
        );

        require(_claim() != 0, "no rewards to claim");
    }

    function totalStake() public view returns (uint256) {
        if (block.number < stakingStartBlock) return 0;

        uint256 elapsed = block.number - stakingStartBlock;
        if (elapsed >= progressiveStakingBlocks)
            return totalDepositedAmount - totalWithdrawedAmount;

        uint256 initialStake = (totalDepositedAmount * initialStakingRatio) /
            MULTIPLIER;

        uint256 linearStake = ((totalDepositedAmount - initialStake) *
            elapsed) / progressiveStakingBlocks;

        return initialStake + linearStake - totalWithdrawedAmount;
    }

    function stakeOf(address user) public view returns (uint256) {
        if (
            block.number < stakingStartBlock ||
            investorInfo[user].depositedAmount == 0
        ) return 0;

        uint256 elapsed = block.number - stakingStartBlock;
        if (elapsed >= progressiveStakingBlocks)
            return
                investorInfo[user].depositedAmount -
                investorInfo[user].withdrawedAmount;

        uint256 initialStake = (investorInfo[user].depositedAmount *
            initialStakingRatio) / MULTIPLIER;

        uint256 linearStake = ((investorInfo[user].depositedAmount -
            initialStake) * elapsed) / progressiveStakingBlocks;

        return initialStake + linearStake - investorInfo[user].withdrawedAmount;
    }

    function rewardsOf(address user) public view returns (uint256) {
        return
            (stakeOf(user) *
                (rewardIndex - investorInfo[user].claimedRewardIndex)) /
            MULTIPLIER;
    }

    function _claim() private returns (uint256) {
        require(
            block.number >= stakingStartBlock,
            "staking phase hasn't started"
        );

        uint256 rewards = rewardsOf(msg.sender);
        investorInfo[msg.sender].claimedRewardIndex = rewardIndex;

        if (rewards != 0) rewardToken.transfer(msg.sender, rewards);

        return rewards;
    }
}
