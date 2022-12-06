
pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Rewards is Ownable {
    IERC20 public rewardsToken;

    mapping(address => uint) public rewards;

    constructor(address _rewardsToken) {
        rewardsToken = IERC20(_rewardsToken);
    }

    function setReward(address account,uint256 amount)  public onlyOwner  {
        rewards[account] = amount;
    }

    function claimReward() public{
        uint256 reward = rewards[msg.sender];
        rewards[msg.sender] = 0;
        rewardsToken.transfer(msg.sender, reward*10**18);
    }
}
