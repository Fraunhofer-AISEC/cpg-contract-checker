contract RefundableCrowdsale {
  uint256 cap;

  RefundableCrowdsale (uint256 _cap) {
    cap = _cap;
  }
}


contract MyCrowdsale is RefundableCrowdsale {

  
  function MyCrowdsale (cap) RefundableCrowdsale (
    ethToWeiConverter(cap)
  ) {
    ...
  }

  function ethToWeiConverter(uint256 eths) returns (uint256) {
    return eths * 10**18
  }
}
