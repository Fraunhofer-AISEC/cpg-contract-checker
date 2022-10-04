uint transactionFee = (msg.value * 2) / 100;
uint transactionReward = (msg.value * 2) / 100;
uint receiverMoney = msg.value - limitTransactionCosts(transactionFee - transactionReward);
