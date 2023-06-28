pragma solidity ^0.4.16;

interface token {
  function transfer(address receiver, uint amount) external;
}

contract Crowdsale {
  address public beneficiary;
  uint public fundingGoal;
  uint public amountRaised;
  uint public deadline;
  uint public price;
  token public tokenReward;
  mapping(address => uint256) public balanceOf;

  event FundTransfer(address backer, uint amount, bool isContribution);

  function Crowdsale(
    address ifSuccessfulSendTo,
    uint fundingGoalInEthers,
    uint durationInMinutes,
    uint etherCostOfEachToken,
    address addressOfTokenUsedAsReward
  ) public {
    beneficiary = ifSuccessfulSendTo;
    fundingGoal = fundingGoalInEthers * 1 ether;
    deadline = now + durationInMinutes * 1 minutes;
    price = etherCostOfEachToken * 1 ether;
    tokenReward = token(addressOfTokenUsedAsReward);
  }

  function () public payable {
    uint amount = msg.value;
    balanceOf[msg.sender] += amount;
    amountRaised += amount;
    tokenReward.transfer(msg.sender, amount / price);
    FundTransfer(msg.sender, amount, true);
  }
}
