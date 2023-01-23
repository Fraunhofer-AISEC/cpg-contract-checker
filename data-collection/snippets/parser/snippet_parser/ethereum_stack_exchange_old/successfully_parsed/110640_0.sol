function _tokenTransfer(address sender, address recipient, uint256 amount) private {
    if(_isExcludedFromFee[sender] || _isExcludedFromFee[recipient]){
        removeAllFee();
    }
    
    
    uint256 burnAmt = amount.mul(_burnFee).div(100);
    uint256 charityAmt = amount.mul(_charityFee).div(100);

    if (_isExcluded[sender] && !_isExcluded[recipient]) {
        _transferFromExcluded(sender, recipient, (amount.sub(burnAmt).sub(charityAmt)));
    } else if (!_isExcluded[sender] && _isExcluded[recipient]) {
        _transferToExcluded(sender, recipient, (amount.sub(burnAmt).sub(charityAmt)));
    } else if (!_isExcluded[sender] && !_isExcluded[recipient]) {
        _transferStandard(sender, recipient, (amount.sub(burnAmt).sub(charityAmt)));
    } else if (_isExcluded[sender] && _isExcluded[recipient]) {
        _transferBothExcluded(sender, recipient, (amount.sub(burnAmt).sub(charityAmt)));
    } else {
        _transferStandard(sender, recipient, (amount.sub(burnAmt).sub(charityAmt)));
    }
    
    
    _taxFee = 0;
    _liquidityFee = 0;

    
    _transferStandard(sender, address(0), burnAmt);
    _tTotal = _tTotal.sub(burnAmt);
    
    _transferStandard(sender, charityWallet, charityAmt);

    
    _taxFee = _previousTaxFee;
    _liquidityFee = _previousLiquidityFee;

    if(_isExcludedFromFee[sender] || _isExcludedFromFee[recipient])
        restoreAllFee();
}
