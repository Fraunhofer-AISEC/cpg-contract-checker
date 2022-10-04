function getNumber(uint256 number) public pure returns (uint256) {
    
    uint256 decimals = 18;
    uint256 checkDecimals = 3;
    uint256 factor = 10**(decimals - checkDecimals);
    uint256 numberAfterDecimals = number % (10**decimals);
    return numberAfterDecimals/factor;
  
  }
