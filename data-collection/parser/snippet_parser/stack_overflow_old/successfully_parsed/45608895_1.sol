uint transactionFee = (msg.value * 2) / 100;
uint transactionReward = (msg.value * 2) / 100;
transactionFee = limitTransactionCosts(transactionFee);
transactionReward = limitTransactionCosts(transactionReward);

uint receiverMoney = msg.value - transactionFee - transactionReward;
