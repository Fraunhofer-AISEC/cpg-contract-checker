function transferWorker(
    address pFrom,
    address pTo,
    uint pValue
)
    private
{
    require(pTo != address(0));
    balances[pFrom] = balances[pFrom].sub(pValue);
    balances[pTo] = balances[pTo].add(pValue);
    otherContract.processTransfer(pFrom, pTo, pValue);
    emit Transfer(pFrom, pTo, pValue);
}
