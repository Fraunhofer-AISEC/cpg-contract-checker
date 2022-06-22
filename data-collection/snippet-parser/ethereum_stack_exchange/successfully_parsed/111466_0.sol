  function _getValues(uint256 tAmount) private view returns (uint256, uint256, uint256, uint256, uint256, uint256, uint256, uint256 ) {
        (uint256 tFee, uint256 tBurn, uint256 tCharity, uint256 tLiquidity) = _getTBasics(tAmount, _TAX_FEE, _BURN_FEE, _CHARITY_FEE, _LIQUIDITY_FEE);
        uint256 tTransferAmount = getTTransferAmount(tAmount, tFee, tBurn, tCharity, tLiquidity);
        uint256 currentRate =  _getRate();
        (uint256 rAmount, uint256 rFee) = _getRBasics(tAmount, tFee, currentRate);
        uint256 rTransferAmount = _getRTransferAmount(rAmount, rFee, tBurn, tCharity, tLiquidity, currentRate);
        return (rAmount, rTransferAmount, rFee, tTransferAmount, tFee, tBurn, tCharity, tLiquidity);
    }
