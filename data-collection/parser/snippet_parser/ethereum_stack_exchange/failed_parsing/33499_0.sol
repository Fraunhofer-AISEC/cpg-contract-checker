contract Crowdsale {
    MintableToken public token;
    uint256 public someInt;
    [...]

    function Crowdsale (uint256 _constructorArgument){
      someInt = _constructorArgument;
      token   = createTokenContract();
    }

    function createTokenContract() internal returns (MintableToken) 
    {
      return new MintableToken();
    }
