function ownerSafeWithdrawal() external onlyOwner  {
        uint balanceToSend = address(this).balance;
        beneficiary.transfer(balanceToSend);
        emit FundTransfer(beneficiary, balanceToSend, false);
    }

function checkFundingGoal() internal {
        if (!fundingGoalReached) {
            if (amountRaised >= fundingGoal) {
                fundingGoalReached = true;
                emit GoalReached(beneficiary, amountRaised);
            }
        }
    }
