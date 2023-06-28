    function getUserAccountData(address _miskin) internal view returns (AaveUserData memory) {
        ILendingPool lendingPool = ILendingPool(aaveLendingPoolAddress);
        (uint256 totalCollateralETH, uint256 totalDebtETH, uint256 availableBorrowsETH, uint256 currentLiquidationThreshold, uint256 ltv, uint256 healthFactor) = lendingPool.getUserAccountData(_miskin);
        return AaveUserData(totalCollateralETH, totalDebtETH, availableBorrowsETH, currentLiquidationThreshold, ltv, healthFactor);
    }