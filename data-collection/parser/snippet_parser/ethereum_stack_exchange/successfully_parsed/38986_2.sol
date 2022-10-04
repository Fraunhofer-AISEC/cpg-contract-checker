function loan(uint _amount, uint _fee, uint _numeratorPercentageAdvanced, uint _denumeratorPercentageAdvanced) public {         
        loanData.amountETH = _amount;         
        loanData.fee = _fee;                        

        loanState = LoanState.not_funded;         
        loanReceipiant = msg.sender;       

        amountToAdvance = (_amount * _numeratorPercentageAdvanced) / _denumeratorPercentageAdvanced;

        NewLoan(this, loanData.amountETH, loanData.fee);     
    }   
