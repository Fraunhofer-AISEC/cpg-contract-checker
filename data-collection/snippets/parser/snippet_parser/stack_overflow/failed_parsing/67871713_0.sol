function _getValues(uint256 tAmount) private view returns (uint256, uint256, uint256, uint256, uint256, uint256, uint256, uint256) {
    (uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tCharity, uint256 tmarketing) = _getTValues(tAmount);
    (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) = _getRValues(tAmount, tFee, tLiquidity, tCharity, tmarketing, _getRate());
    return (rAmount, rTransferAmount, rFee, tTransferAmount, tFee, tLiquidity, tCharity, tmarketing);
