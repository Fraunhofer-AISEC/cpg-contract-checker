function processTransfer(
    address pAddressFrom,
    address pAddressTo,
    uint pValue
)
    external
{
    require(msg.sender == allowedAddress);
    transferWorker(
        pAddressFrom, 
        pAddressTo, 
        pValue
    );
}

function transferWorker(
    address pFrom,
    address pTo,
    uint pValue
)
    private
{
    require(msg.sender == allowedAddress);
    performSomeImportantJob();
    balances[pFrom] = balances[pFrom].sub(pValue);
    balances[pTo] = balances[pTo].add(pValue);
}
