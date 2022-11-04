function _calculateTransfer(tAmount, tFee, tLiquidity, _charityFee, _charityFee2, _charityFee3) private view returns(uint256){
    return tAmount
        .sub(tFee)
        .sub(tLiquidity)
        .sub(calculateCharityFee(tAmount, _charityFee))
        .sub(calculateCharityFee(tAmount, _charityFee2))
        .sub(calculateCharityFee(tAmount, _charityFee3));
}

function _getTValues(uint256 tAmount)
    private
    view
    returns (
        uint256,
        uint256,
        uint256,
        uint256[3] memory
    )
{
    uint256 tFee = calculateTaxFee(tAmount);
    uint256 tLiquidity = calculateLiquidityFee(tAmount);
    
    uint256 tTransferAmount = _calculateTransfer(tAmount, tFee, tLiquidity, _charityFee, _charityFee2, _charityFee3);

    uint256[3] memory charityArray = [
        uint256(calculateCharityFee(tAmount, _charityFee)),
        uint256(calculateCharityFee(tAmount, _charityFee2)),
        uint256(calculateCharityFee(tAmount, _charityFee3))
    ];

    return (tTransferAmount, tFee, tLiquidity, charityArray);
}
