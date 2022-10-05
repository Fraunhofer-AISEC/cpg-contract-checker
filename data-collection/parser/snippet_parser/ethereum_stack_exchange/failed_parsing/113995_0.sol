contract rewardToken{
address StakingPoolAddress = {Address of staking pool contract}
function mint(address to, uint256 amount) external {
        require(msg.sender == owner() || msg.sender == StakingPoolAddress);
         _balances[to] = _balances[to].add(amount);
         _totalSupply = _totalSupply.add(amount);
  }
}
contract StakingPool{
 mapping(address => uint256) public stakes;
IERC20 public rewardTokenAdd;
   function distributeRewards(IERC20 AddOfrewardToken )public payable onlyOwner
   {
        rewardTokenAdd = AddOfrewardToken;
       for (uint256 s = 0; s < stakeholders.length; s += 1){
           reward.mint(stakeholders[s], stakes[stakeholders[s]]);
       }
   }
}
