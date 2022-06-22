    function addLoan(address _newLoan) public {
        
        Loan myLoan = Loan(_newLoan);
        loans.push(myLoan) -1;
        originatorLoanBalance += myLoan.getBalance();

    } 

function makeLoan(bytes16 _loanID, address _borrower, uint _loanBalance) payable public {
    
    Loan myLoan = new Loan(_loanID, _borrower, address(this), _loanBalance);

    
    loans.push(myLoan) -1;

    
    addLoan(address(myLoan));

    
    if (!_borrower.send(_loanBalance)) {
        revert();
    }

} 
