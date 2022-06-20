contract MintedCrowdsale is Crowdsale {
  constructor() internal {} 
  function _deliverTokens(
    address beneficiary,
    uint256 tokenAmount
  )
    internal
  {
    
    require(
      ERC20Mintable(address(token())).mint(beneficiary, tokenAmount));
  }
}
