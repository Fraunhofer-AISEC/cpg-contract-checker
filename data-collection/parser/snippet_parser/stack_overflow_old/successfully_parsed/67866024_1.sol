uint256 public _taxFee = 3; 
uint256 private _previousTaxFee = _taxFee;

uint256 public _liquidityFee = 3; 
uint256 private _previousLiquidityFee = _liquidityFee;

uint256 public _charityFee = 2; 
uint256 private _previousCharityFee = _charityFee;

uint256 public _marketingFee = 2; 
uint256 private _previousMarketingFee = _marketingFee;

function calculateTaxFee(uint256 _amount) private view returns (uint256) {
    return _amount.mul(_taxFee).div(
        10**2
    );
}

function calculateLiquidityFee(uint256 _amount) private view returns (uint256) {
    return _amount.mul(_liquidityFee).div(
        10**2
    );
}

function calculateCharityFee(uint256 _amount) private view returns (uint256) {
    return _amount.mul(_charityFee).div(
        10**2
    );
}

function calculateMarketingFee(uint256 _amount) private view returns (uint256) {
    return _amount.mul(_marketingFee).div(
        10**2
    );
}

function _getValues(uint256 tAmount) private view returns (uint256, uint256, uint256, uint256, uint256, uint256, uint256, uint256) {
    (uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tCharity, uint256 tMarketing) = _getTValues(tAmount);
    (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) = _getRValues(tAmount, tFee, tLiquidity, tCharity, tMarketing, _getRate());
    return (rAmount, rTransferAmount, rFee, tTransferAmount, tFee, tLiquidity, tCharity, tMarketing);
}

function _getTValues(uint256 tAmount) private view returns (uint256, uint256, uint256, uint256, uint256) {
    uint256 tFee = calculateTaxFee(tAmount);
    uint256 tLiquidity = calculateLiquidityFee(tAmount);
    uint256 tCharity = calculateCharityFee(tAmount);
    uint256 tMarketing = calculateMarketingFee(tAmount);
    uint256 tTransferAmount = tAmount.sub(tFee).sub(tLiquidity);
    return (tTransferAmount, tFee, tLiquidity, tCharity, tMarketing);
}

function _getRValues(uint256 tAmount, uint256 tFee, uint256 tLiquidity, uint256 tCharity, uint256 tMarketing, uint256 currentRate) private pure returns (uint256, uint256, uint256) {
    uint256 rAmount = tAmount.mul(currentRate);
    uint256 rFee = tFee.mul(currentRate);
    uint256 rLiquidity = tLiquidity.mul(currentRate);
    uint256 rCharity = tCharity.mul(currentRate);
    uint256 rMarketing = tMarketing.mul(currentRate);
    uint256 rTransferAmount = rAmount.sub(rFee).sub(rLiquidity).sub(rCharity).sub(rMarketing);
    return (rAmount, rTransferAmount, rFee);
}
