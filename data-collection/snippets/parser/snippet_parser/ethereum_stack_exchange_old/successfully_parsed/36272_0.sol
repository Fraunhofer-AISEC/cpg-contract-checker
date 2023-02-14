uint gasPriceInWei = tx.gasprice * 1000000000;
uint percentOfGasPrice = uint(transactionCostInWei) * uint(.1);
