   function safeWithdrawal() afterDeadline {  
        if (!fundingGoalReached) {  
            uint amount = balanceOf[msg.sender];  
            balanceOf[msg.sender] = 0;  
            if (amount > 0) {  
                if (msg.sender.send(amount)) {  
                    FundTransfer(msg.sender, amount, false);  
                } else {  
                    balanceOf[msg.sender] = amount;  
                }
            }
        }   if (fundingGoalReached && beneficiary == msg.sender) {  
            if (beneficiary.send(amountRaised)) {  
                FundTransfer(beneficiary, amountRaised, false);  
            } else {  
                
                fundingGoalReached = false;  
            }  
        }  
    }   }
