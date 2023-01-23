 

  function getTokenAmount(uint256 weiAmount) internal view 
returns(uint256) {
    return weiAmount.mul(rate);
  }
