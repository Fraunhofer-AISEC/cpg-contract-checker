contract SMTCrowdsale is Crowdsale {
  function SMTCrowdsale (uint256 _startTime, uint256 _endTime, utin256 _rate, address _wallet) Crowdsale (_startTime, _endTime, _rate, _wallet) {
  }

  function createTokenContract () internal returns (MintableToken) {
    return new SimpleCrowdsaleToken ();
  }
}
