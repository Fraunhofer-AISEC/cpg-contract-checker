function payRate() payable {
   require(pool != address(0));

   amountPaid += msg.value;

   TransactionPool(pool).receivePayment.value(msg.value)();
}
