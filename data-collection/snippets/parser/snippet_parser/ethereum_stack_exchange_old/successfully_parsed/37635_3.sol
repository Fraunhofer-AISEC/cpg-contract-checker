pragma solidity ^0.4.18;

contract Borrower {
    string  public borrowerName;
    uint256 public amountToPay;

    function payLoan(Loan _loan) payable public {

        
        Loan loan   = Loan(_loan);
        amountToPay = msg.value;

        
        loan.makePayment.value(amountToPay)();
    }   

    function getThisBalance() public view returns (uint256){

        return this.balance;
    }
} 

contract Loan {

        address public borrower;
        uint256 public loanBalance;

        uint256 public received;

        function Loan(address _borrower, uint _loanBalance) public {
            borrower    = _borrower;
            loanBalance = _loanBalance;
            }

        function makePayment() payable public {

            received    =  msg.value;
            loanBalance -= received;
        }

    function getThisBalance() public view returns (uint256){

        return this.balance;
    }
} 
