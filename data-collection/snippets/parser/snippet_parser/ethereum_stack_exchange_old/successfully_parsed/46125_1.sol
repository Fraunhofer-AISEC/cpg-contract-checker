pragma solidity ^0.4.18;

contract SampleCrowdsale is CappedCrowdsale, RefundableCrowdsale, MintedCrowdsale {


  function SampleCrowdsale(
    uint256 _openingTime,
    uint256 _closingTime,
    uint256 _rate,
    address _wallet,
    uint256 _cap,
    MintableToken _token,
    uint256 _goal
  ) public
    Crowdsale(_rate, _wallet, _token)
    CappedCrowdsale(_cap)
    TimedCrowdsale(_openingTime, _closingTime)
    RefundableCrowdsale(_goal)
  {
    
    
    require(_goal <= _cap);
  }

  function tokenTotalSupply()
      public
      constant
      returns (uint256)
  {
      return token.totalSupply();
  } 
}
