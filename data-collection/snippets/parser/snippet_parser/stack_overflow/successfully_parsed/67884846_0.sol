function _getTValues(uint256 tAmount) private view returns (uint256, uint256, uint256, uint256, uint256, uint256) {
        uint256 tFee = calculateTaxFee(tAmount);
        uint256 tLiquidity = calculateLiquidityFee(tAmount);
        uint256 tDev = calculateDevFee(tAmount);
        uint256 tBurn = calculateBurnFee(tAmount);
        uint256 tCharity = calculateCharityFee(tAmount);
        uint256 tTransferAmount = tAmount.sub(tFee).sub(tLiquidity);
                tTransferAmount = tTransferAmount.sub(tDev);
                tTransferAmount = tTransferAmount.sub(tCharity);
                tTransferAmount = tTransferAmount.sub(tBurn);

        return (tTransferAmount, tFee, tLiquidity, tDev, tBurn, tCharity);
    }
