function sendFundsToCompany ()
    public
    payable
    onlyBuyer
    returns (bool completed)
{
    moneyInEscrow = msg.value;
    companyEscrow.transfer(moneyInEscrow);
    return true;
}
