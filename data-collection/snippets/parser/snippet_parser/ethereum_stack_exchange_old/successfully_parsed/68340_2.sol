contract BuyCompleteSets {
  CompleteSets constant private completeSets = CompleteSets(0x48FCc9d538B9C86bA9D35b3eB0e7f64EE2B4664f);
  address constant private cash = 0x2Da4d465978981BD75BbaC4C9f3bdA10bE0B465c;
  address constant private augur = 0x990B2D2aF7e87cd015A607c3A95d7622c9bBeDe1;


  function BuyCompleteSets(
  ) 
  public 
  {
      ICash(cash).approve(augur, uint256(-1));
  }

  function BuyShares (
      IMarket _market
  )
  public 
  payable
  {
      uint256 amount = msg.value / _market.getNumTicks();
      completeSets.publicBuyCompleteSets.value(msg.value)(_market, amount);
  }
}
