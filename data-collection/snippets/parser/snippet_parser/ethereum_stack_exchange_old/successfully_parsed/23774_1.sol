contract FixcoinCrowdsale is owned {

    address public beneficiary;
    uint256 public minimumFundingGoal;
    uint256 public fundingGoal; 
    uint256 public amountRaised;
    uint8 public tokensInEth;
    uint public deadline;
    Token public tokenReward;
    mapping(address => uint256) public balanceOf;

    event MinimumGoalReached(address _beneficiary, uint _amountRaised);
    event GoalReached(address _beneficiary, uint _amountRaised);
    event FundTransfer(address _backer, uint amount, bool _isContribution);

    bool minFundingGoalReached = false;
    bool fundingGoalReached = false;
    bool crowdsaleClosed = false;

    uint startDate;

    function FixcoinCrowdsale(
        address ifSuccessfulSendTo,
        uint256 minimumFundingGoalInEther,
        uint256 fundingGoalInEther,
        uint256 durationInMinutes,
        uint8 tokensInEther,
        Token addressOfTokenUsedAsReward
    ) {
        beneficiary = ifSuccessfulSendTo;
        minimumFundingGoal = minimumFundingGoalInEther * 10**18;
        fundingGoal = fundingGoalInEther * 10**18;
        deadline = now + durationInMinutes * 1 minutes;
        tokenReward = Token(addressOfTokenUsedAsReward);
        startDate = now;
        tokensInEth = tokensInEther;
    }

    function calculateTokensAmount(uint256 ethAmount) internal returns (uint8 bonuses) {
        bonuses = uint8(ethAmount * tokensInEth / 10**18);
        return bonuses;
    }

    function sendFundsAndReceiveBonuses() payable {
        if (crowdsaleClosed) revert();
        uint amount = msg.value;
        balanceOf[msg.sender] += amount;
        amountRaised += amount;
        uint8 bonusAmount;
        if (now < startDate + 1 * 1 minutes) {
            bonusAmount += calculateTokensAmount(amount) * 2;
        }
        else if (now < startDate + 2 * 1 minutes) {
            bonusAmount += calculateTokensAmount(amount) * 150 / 100;
        }
        else if (now < startDate + 3 * 1 minutes) {
            bonusAmount += calculateTokensAmount(amount) * 133 / 100;
        }
        else if (now < startDate + 10 * 1 minutes) {
            bonusAmount += calculateTokensAmount(amount) * 125 / 100;
        }
        tokenReward.transfer(msg.sender, bonusAmount);
        FundTransfer(msg.sender, amount, true);
    }

    modifier afterDeadline() { if (now >= deadline) _; }

    function check() internal {
        if (amountRaised >= minimumFundingGoal){
            minFundingGoalReached = true;
            MinimumGoalReached(beneficiary, amountRaised);
        }
        if (amountRaised >= fundingGoal){
            fundingGoalReached = true;
            GoalReached(beneficiary, amountRaised);
            crowdsaleClosed = true;
            deadline = now;
        }
    }

    function safeWithdrawal() afterDeadline {
        check();
        if (!fundingGoalReached && !minFundingGoalReached) {
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

        if ((minFundingGoalReached || fundingGoalReached) && beneficiary == msg.sender) {
            if (beneficiary.send(amountRaised)) {
                FundTransfer(beneficiary, amountRaised, false);
            } else {
                fundingGoalReached = false;
            }
        }
    }
}
