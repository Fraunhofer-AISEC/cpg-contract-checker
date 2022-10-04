
    uint transactionCosts = (msg.value * 4) / 1000; 
    transactionCosts = limitTransactionCosts(transactionCosts);

    uint transactionFee = transactionCosts / 2;
    uint transactionReward = transactionCosts / 2;

    uint receiverMoney = msg.value - transactionCosts;
