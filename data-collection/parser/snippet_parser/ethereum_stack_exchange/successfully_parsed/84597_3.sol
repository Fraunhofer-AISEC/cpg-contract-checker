interface ILendingPoolCore {
    function getReserveAvailableLiquidity(address _reserve) external view returns (uint256 _availableLiquidity);
}
