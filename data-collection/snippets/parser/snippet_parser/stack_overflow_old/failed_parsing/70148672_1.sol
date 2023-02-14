 
  function _decodeParams(bytes memory params) internal pure returns (LiquidationParams memory) {
    (
      address collateralAsset,
      address borrowedAsset,
      address user,
      uint256 debtToCover,
      bool useEthPath
    ) = abi.decode(params, (address, address, address, uint256, bool));

    return LiquidationParams(collateralAsset, borrowedAsset, user, debtToCover, useEthPath);
  }
}
