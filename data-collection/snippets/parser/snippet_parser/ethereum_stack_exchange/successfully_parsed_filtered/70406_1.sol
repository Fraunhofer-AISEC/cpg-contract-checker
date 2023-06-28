function addTransaction(address _address,uint _amount) public {
    Transaction memory newRequest = Transaction({
        Creditor: _address,
        Amount: _amount,
        arrayPointer: transactionAddresses.push(_address)-1});
    TransactionsMap[_address]=newRequest;
}
