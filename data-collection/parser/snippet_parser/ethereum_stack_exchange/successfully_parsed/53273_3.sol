function sendFundsToSeller ()
    public
    payable
    onlyCompanyEscrow
    returns (bool completed)
{
    seller.transfer(moneyInEscrow);
    moneyInEscrow = 0;
    return true;
}
