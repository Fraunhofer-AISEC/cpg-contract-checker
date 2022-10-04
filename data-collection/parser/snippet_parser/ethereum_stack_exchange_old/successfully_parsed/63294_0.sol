




function addTransaction(address destination, uint value, bytes data)
    internal
    returns (uint transactionId)
{
    transactionId = transactionCount;
    transactions[transactionId] = Transaction({
        destination: destination,
        value: value,
        data: data,
        executed: false
    });
    transactionCount += 1;
    Submission(transactionId);
}
