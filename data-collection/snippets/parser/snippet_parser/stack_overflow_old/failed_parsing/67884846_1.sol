function _getTValues(uint256 tAmount) ... {
    uint256 tFeesSum = calculateSumOfFees(tAmount);
    uint256 tTransferAmount = tAmount - tFeesSum; 
    return tTransferAmount;
}
