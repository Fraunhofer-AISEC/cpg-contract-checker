function payBill(uint value, address account) payable public {
account.transfer(value);
transactionCount += 1;
transactionAmount += value;
