function checkMarketValidity (
    address _augur,
    address _market
)
public 
payable
    public 
returns (bool)
{
    IMarket market = IMarket(_market);
    IAugur augur = IAugur(_augur);

    bool validity = augur.isValidMarket(market);
    return validity;
}
