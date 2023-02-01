    pragma solidity ^0.4.18;

contract Borrower {
    uint256 public amountReceived;

    function Borrower() payable public {
    }

    function payLoan(Loan _loan) payable public {

        
        Loan loan = Loan(_loan);
        amountReceived = msg.value;

        
        loan.payLoan.value(amountReceived)();
    }   

    function getThisBalance() public view returns (uint256){

        return this.balance;
    }
} 

contract Loan {
    address public borrower;
    uint256 public loanBalance;

    function payLoan() payable public {
        uint256 received = msg.value;
        loanBalance -= received;
        }

    function Loan(address _borrower) payable public {
        borrower    = _borrower;
        loanBalance = msg.value;
        }

    function getThisBalance() public view returns (uint256){

        return this.balance;
    }
} 
