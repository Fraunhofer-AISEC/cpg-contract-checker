
pragma solidity ^0.8.6;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract staking{
    IERC20 public s_stakingToken;
    IERC20 public s_rewardsToken;

     constructor(address stakingToken, address rewardsToken){
        s_stakingToken=IERC20(stakingToken);
        s_rewardsToken=IERC20(rewardsToken);
    }
}
