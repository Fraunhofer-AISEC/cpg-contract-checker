function _getValues(uint256 tAmount) private view returns (uint256, uint256, uint256, uint256, uint256, uint256, uint256, uint256) {
    (uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tCharity, uint256 tmarketing) = _getTValues(tAmount);
    (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) = _getRValues(tAmount, tFee, tLiquidity, tCharity, tmarketing, _getRate());
    
    external pure returns(uint256) {
    
    uint256 result = 0;
    
    {
        result = rAmount+rTransferAmount+rFee+tTransferAmount+tFee;
    }
    
    {
        result = result+tLiquidity+tCharity+tmarketing;
    }

    return result;
