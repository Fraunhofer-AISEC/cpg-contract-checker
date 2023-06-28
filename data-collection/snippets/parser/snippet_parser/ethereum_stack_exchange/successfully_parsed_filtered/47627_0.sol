    contract StartCoinCrowdsale is TimedCrowdsale, MintedCrowdsale, CappedCrowdsale, FinalizableCrowdsale   { 

    uint256 public constant TOTAL_SHARE = 100;
    uint256 public constant CROWDSALE_SHARE = 80;
    uint256 public constant FOUNDATION_SHARE = 20;
    function StartCoinCrowdsale
        (
            uint256 _openingTime,
            uint256 _closingTime,
            uint256 _rate,
            address _wallet,
            uint256 _cap,
            MintableToken _token
        )
        public
        Crowdsale(_rate, _wallet, _token) 
        TimedCrowdsale(_openingTime, _closingTime) 
        CappedCrowdsale(_cap)
        FinalizableCrowdsale() {
    }

    function finalization() internal {
        uint256 totalSupply = token.totalSupply();
        uint256 finalSupply = TOTAL_SHARE.mul(totalSupply).div(CROWDSALE_SHARE);

        
        MintableToken(token).mint(wallet, FOUNDATION_SHARE.mul(finalSupply).div(TOTAL_SHARE));
        super.finalization();
    }
}
