contract Crowdsale is RefundableCrowdsale, CappedCrowdsale, PostDeliveryCrowdsale, AllowanceCrowdsale, StagedCrowsale {
    constructor(
        uint256 rate, address wallet, IERC20 token,
        uint256 openingTime, uint256 closingTime,
        uint cap,
        uint256 goal,
        address tokenWallet) 
        Crowdsale(rate, wallet, token)
        TimedCrowdsale(openingTime, closingTime)
        CappedCrowdsale(cap)
        RefundableCrowdsale(goal)
        AllowanceCrowdsale(tokenWallet)
        StagedCrowsale()
    public {}

    
    function() external payable {
        buyTokens(msg.sender); 
    }
}        
