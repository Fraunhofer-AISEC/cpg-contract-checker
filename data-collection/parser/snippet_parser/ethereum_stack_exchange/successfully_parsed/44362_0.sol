contract TestCrowdsale is IncreasingPriceCrowdsale, MintedCrowdsale {
    function TestCrowdsale(
        uint256 _openingTime,
        uint256 _closingTime,
        uint256 _initialRate,
        uint256 _finalRate,
        address _wallet,
        MintableToken _token
    ) public
      Crowdsale(_initialRate, _wallet, _token)
      TimedCrowdsale(_openingTime, _closingTime)
      IncreasingPriceCrowdsale(_initialRate, _finalRate)
    {

    }
}
