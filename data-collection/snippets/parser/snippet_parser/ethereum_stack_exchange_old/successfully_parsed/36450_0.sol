uint8 public transactionCounter;
function ContractConstructor() public {
    transactionCounter = 0;
}

function getTransactionCounter() returns (uint8) {
    return transactionCounter;
}

function trns() {
    transactionCounter += 1;
}
