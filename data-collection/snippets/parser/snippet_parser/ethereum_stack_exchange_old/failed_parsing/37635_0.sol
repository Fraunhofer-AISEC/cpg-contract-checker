
Loan myLoan = Loan(_loanAddress);
uint256 payment = msg.value;


if (funds >= payment){

    
    myLoan.makePayment.value(payment);
    funds -= payment;
}else{

    
    myLoan.makePayment.value(funds);
    funds = 0;
}
