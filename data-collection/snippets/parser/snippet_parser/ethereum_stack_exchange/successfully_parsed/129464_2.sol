function getNumber(uint256 number) public pure returns (uint256) {
  
    return (number % (10**18))/(10**(15));
  
  }
