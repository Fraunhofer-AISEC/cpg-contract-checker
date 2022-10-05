function getAvailableLiquidity(ILendingPoolCore _lendingPoolCore) internal view returns (uint256 _availableLiquidity)
{
    return _lendingPoolCore.getReserveAvailableLiquidity(RAW_ETH_ASSET);
}
