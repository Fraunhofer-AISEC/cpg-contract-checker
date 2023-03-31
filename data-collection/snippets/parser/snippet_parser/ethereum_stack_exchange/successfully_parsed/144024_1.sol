contract Test {
mapping(address => uint256) public balances;

function checkAndDistributeReward(address root) public {
    
        uint256 rewardAmount = 2 ether;
        
        
        balances[root] += rewardAmount;
        
    
}
}