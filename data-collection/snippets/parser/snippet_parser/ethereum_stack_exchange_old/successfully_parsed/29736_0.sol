function submitTransaction(address destination, uint value, bytes data)
    public
    returns (uint transactionId)
{
    transactionId = addTransaction(destination, value, data);
    confirmTransaction(transactionId);
}
