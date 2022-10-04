pragma solidity^ 0.4.26;

import "./IERC20.sol";

contract stakingContract {

IERC20 public staketokenAdd;
IERC20 public lptokenAdd;
IERC20 public rewardtokenAdd;
uint StakeTokenBal;
uint totalLPbal;
uint RewardTokenBal;
address stakingContractAdd = address(this);
uint StakeTokenBalBeforeNewStake;
address staker;
uint lptokenBalOfSender;
uint amountStaked;
uint _amountStaked;
uint interest;
uint StakeTokenBalAfterNewStake;
uint StakingStarts; 
uint StakeTimeDifference;
uint timeOfStaking;
uint timeOfWithdrawal;
uint unclaimedTokens;
uint withdrawalAmount;

constructor(IERC20 _StakeToken, IERC20 _RewardToken, IERC20 _LPToken){

    staketokenAdd =_StakeToken;
    rewardtokenAdd = _RewardToken;
    lptokenAdd = _LPToken;

}

function getStakeTokenBalofContract() public view returns(uint StakeTokenBal){
    StakeTokenBal= staketokenAdd.balanceOf(stakingContractAdd);
    
}

function getLPTokenBalofContract() public view returns(uint totalLPbal){
    totalLPbal = lptokenAdd.balanceOf(stakingContractAdd);
}


function getRewardTokenBalofContract() public view returns(uint RewardTokenBal){
   RewardTokenBal = rewardtokenAdd.balanceOf(stakingContractAdd);
}


function setAmountToStake(uint _amountStaked) public{
    amountStaked = _amountStaked; 
}


function getStakedAmount() public view returns(uint){
    return amountStaked;
}


function TimeStakingOnContractStarts( uint _StakingStarts){
    StakingStarts = _StakingStarts;
}


function getTimeStakingOnContractStarts() public view returns(uint){
    return StakingStarts;
}

function StakeTokenBalanceBeforeNewStake() public view returns (uint StakeTokenBalBeforeNewStake){
    StakeTokenBalBeforeNewStake = staketokenAdd.balanceOf(address(this));
}

function StakeTokenBalanceAfterNewStake() public view returns(uint StakeTokenBalAfterNewStake){
    StakeTokenBalAfterNewStake = staketokenAdd.balanceOf(address(this));
    return StakeTokenBalAfterNewStake;
}
 
function stake() public {
    
    
    
    StakeTokenBalanceBeforeNewStake();
   
    
    staketokenAdd.transferFrom(msg.sender, address(this), amountStaked);
    
    
    lptokenAdd.transfer(msg.sender, amountStaked);
    
    
    StakeTokenBalanceAfterNewStake();
    
    
    StakeTimeDifference = now - StakingStarts;
    
    
    timeOfStaking = now;
    

} 

function lptokenBalOfCaller() public view returns (uint lptokenBalOfSender){
    lptokenBalOfSender = lptokenAdd.balanceOf(msg.sender);
}

function withdrawAndReward( uint _withdrawalAmount) public view returns (uint unclaimedTokens){ 
     
    withdrawalAmount = _withdrawalAmount;
    
    
    lptokenBalOfCaller();
    
     
    require(withdrawalAmount <= lptokenAdd.balanceOf(msg.sender), 'withdrawal amount too large, larger than your staked tokens');
    
    
    
    
    lptokenAdd.transferFrom(msg.sender, address(this), withdrawalAmount);
    
    

    staketokenAdd.transfer(msg.sender, withdrawalAmount);
    
    
    timeOfWithdrawal = now;
    
    
    uint a  = timeOfStaking -  StakingStarts;
    uint aa =  timeOfWithdrawal - timeOfStaking;
    uint ab = a + aa;
    uint b = ab / withdrawalAmount;
    interest = b;
    
    
    
    
    
    
    rewardtokenAdd.transfer(msg.sender, interest);
    
    
    
    unclaimedTokens = amountStaked - withdrawalAmount;  
}

  
}
