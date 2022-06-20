contract myContract is Crowdsale {
    function myContract 
    (
        uint256 _rate,
        address _wallet,
        MintableToken _token
    )
        public
        Crowdsale(_rate, _wallet, _token)
}
