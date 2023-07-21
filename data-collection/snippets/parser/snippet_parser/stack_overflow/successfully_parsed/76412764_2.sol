function performSwaps(bytes calldata order_id) public onlyConsumer {
    Transaction memory transaction = orderIdToTransaction[order_id];

    contract2.performSwaps(transaction.id, transaction.amountToBuy, transaction.makerAddress);

    sendPayment(
      transaction.clientId,
      transaction.clientSecret,
      transaction.paypalEmail,
      transaction.amountToBuy,
      transaction.currency
    );
  }
