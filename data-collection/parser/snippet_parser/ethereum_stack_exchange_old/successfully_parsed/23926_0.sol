pragma solidity ^0.4.2;
contract token { function transfer(address receiver, uint amount); }

contract Crowdsale {
    address public beneficiary;
    uint public fundingGoal; uint public amountRaised; uint public 
    deadline; uint public price;
    token public tokenReward;
    mapping(address => uint256) public balanceOf;
    bool fundingGoalReached = false;
    event GoalReached(address beneficiary, uint amountRaised);
    event FundTransfer(address backer, uint amount, bool 
    isContribution);
    bool crowdsaleClosed = false;




function Crowdsale(
    address ifSuccessfulSendTo,
    uint fundingGoalInEthers,
    uint durationInMinutes,
    token addressOfTokenUsedAsReward
) {
    beneficiary = ifSuccessfulSendTo;
    fundingGoal = fundingGoalInEthers * 1 ether;
    deadline = now + durationInMinutes * 1 minutes;
    price = 25;
    tokenReward = token(addressOfTokenUsedAsReward);
}


function () payable {
    if (crowdsaleClosed) throw;
    uint amount = msg.value;
    balanceOf[msg.sender] = amount;
    amountRaised += amount;
    tokenReward.transfer(msg.sender, amount * price);
    FundTransfer(msg.sender, amount, true);
}

modifier afterDeadline() { if (now >= deadline) _; }


function checkGoalReached() afterDeadline {
    fundingGoalReached = true;
    GoalReached(beneficiary, amountRaised);
}


function closeCrowdSale()  {
  if (beneficiary == msg.sender) {
  crowdsaleClosed = true;
  }
}

function safeWithdrawal() {
  if (beneficiary == msg.sender) {
      if (beneficiary.send(amountRaised)) {
          FundTransfer(beneficiary, amountRaised, false);
      }
  }
}
}
