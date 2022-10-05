contract SampleCrowdsale is FinalizableCrowdsale, MintedCrowdsale {

    event CrowdsaleFinalized();

    constructor(
    uint256 openingTime,
    uint256 closingTime,
    uint256 rate,
    address wallet,
    address secWallet, 
    ERC20Mintable token
    )
    public
    Crowdsale(rate, wallet,secWallet, token) 
    TimedCrowdsale(openingTime, closingTime) 
    { 
    }   

}
