pragma solidity ^0.4.18;

interface token {
    function transfer(address receiver, uint amount) public;
}

contract CoinCrowdsale {
    address public beneficiary;
    uint public amountRaised;
    uint public deadline;
    uint public price = 500 wei;
    uint public hardCap = 1000 wei; 
    uint public softCap = 500 wei;
    token public tokenReward;

    mapping(address => uint256) public balanceOf;

    bool softCapReached = false;
    bool hardCapReached = false;
    bool crowdsaleClosed = false;

    event GoalReached(address recipient, uint totalAmountRaised);
    event FundTransfer(address backer, uint amount, bool isContribution);

    
    function CoinCrowdsale (
        address Address,
        address benAddress,
        uint durationInMinutes
    ) public {
        beneficiary = benAddress;
        deadline = now + durationInMinutes * 1 minutes;
        tokenReward = token(Address);
    }

    
    function () payable public {
      require(!crowdsaleClosed);
      require(msg.value > 0.1 ether);
      uint amount = msg.value;
      balanceOf[msg.sender] += amount;
      amountRaised += amount;
      tokenReward.transfer(msg.sender, amount / price);
      FundTransfer(msg.sender, amount, true);
      if (amountRaised >= hardCap){
        hardCapReached = true;
        crowdsaleClosed = true;
      }
    }

    modifier afterDeadline() {
      if (now >= deadline || hardCapReached == true) _;
    }

    
    function checkGoalReached() afterDeadline public {
      if (amountRaised >= softCap){
          softCapReached = true;
          GoalReached(beneficiary, amountRaised);
      }
      crowdsaleClosed = true;
    }


    
    function safeWithdrawal() afterDeadline public {
      if (!softCapReached) {
          uint amount = balanceOf[msg.sender];
          balanceOf[msg.sender] = 0;
          if (amount > 0) {
              if (msg.sender.send(amount)) {
                  FundTransfer(msg.sender, amount, false);
              } else {
                  balanceOf[msg.sender] = amount;
              }
          }
      }

      if (softCapReached && beneficiary == msg.sender) {
        if (beneficiary.send(amountRaised)) {
          FundTransfer(beneficiary, amountRaised, false);
        } else {
          
          softCapReached = false;
        }
      }
    }

}
