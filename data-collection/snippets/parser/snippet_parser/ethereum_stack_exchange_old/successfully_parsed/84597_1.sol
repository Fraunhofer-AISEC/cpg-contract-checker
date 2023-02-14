   function getAvailableLiquidity(ILendingPool _lendingPool) internal view returns (uint256){
    uint256 _availableLiquidity;
    (,_availableLiquidity,,,,,,,,,,,) = _lendingPool.getReserveData(RAW_ETH_ASSET);
    return _availableLiquidity;
  }
