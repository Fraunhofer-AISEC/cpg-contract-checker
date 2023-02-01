function reimburse() payable external {
            require(msg.sender == borrower, 'only borrower can reimburse');
            require(msg.value = amount + interest, 'borrower need to reimburse exactly amount + interest');
            _transitionTo(State.CLOSED);
            lender.transfer(amount + interest);
        }
