contract MultiSigWallet {
struct Transaction {
    address destination;
    uint256 value;
    bytes data;
    bool executed;
}






function submitTransaction(address destination,
    uint256 value,
    bytes memory data)
    public
    returns (uint256 transactionId)
{
    transactionId = addTransaction(destination, value, data);
    confirmTransaction(transactionId);
}



function confirmTransaction(uint256 transactionId)
    public
    ownerExists(msg.sender)
    transactionExists(transactionId)
    notConfirmed(transactionId, msg.sender)
{
    confirmations[transactionId][msg.sender] = true;
    emit Confirmation(msg.sender, transactionId);
    executeTransaction(transactionId);
}



function executeTransaction(uint256 transactionId)
    public
    ownerExists(msg.sender)
    confirmed(transactionId, msg.sender)
    notExecuted(transactionId)
{
    if (isConfirmed(transactionId)) {
        Transaction storage txn = transactions[transactionId];
        txn.executed = true;
        if (
            external_call(
                txn.destination,
                txn.value,
                txn.data.length,
                txn.data
            )
        ) {
            emit Execution(transactionId);
        } else {
            emit ExecutionFailure(transactionId);
            txn.executed = false;
        }
    }
}



function external_call(address destination,
    uint256 value,
    uint256 dataLength,
    bytes memory data)
    internal
    returns (bool)
{
    bool result;
    assembly {
        let x := mload(0x40) 
        let d := add(data, 32) 
        result := call(
            sub(gas(), 34710), 
            
            
            destination,
            value,
            d,
            dataLength, 
            x,
            0 
        )
    }
    return result;
}
}