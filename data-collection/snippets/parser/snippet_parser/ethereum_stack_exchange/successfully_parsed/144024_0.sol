function hasEvenSubtrees(address _node) internal view returns (bool) {
        uint256 leftSubtrees = countSubtrees(nodes[_node].left);
        uint256 rightSubtrees = countSubtrees(nodes[_node].right);
        uint256 totalSubtrees = leftSubtrees + rightSubtrees + 1;
        return (totalSubtrees % 2 == 0);
    }

    function checkAndDistributeReward(address root) private {
        if (hasEvenSubtrees(root)) {
            uint256 rewardAmount = 2 ether;
            nodes[root].balance += rewardAmount;
            contractBalance -= rewardAmount;
            balances[root] += rewardAmount;
            emit RewardGiven(root, rewardAmount);
        }
    }
