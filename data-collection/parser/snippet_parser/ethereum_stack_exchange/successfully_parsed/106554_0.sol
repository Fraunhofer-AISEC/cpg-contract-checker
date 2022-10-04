    function _transferStandard(address sender, address recipient, uint256 tAmount) private {
    (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 charity, uint256 tLiquidity) = _getValues(tAmount);
    _rOwned[sender] = _rOwned[sender].sub(rAmount);
    _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
    _takeLiquidity(tLiquidity);
    _charity(charity);
    _reflectFee(rFee, tFee);
     if(!_isExcludedFromFee[sender])
    emit Transfer(sender, charityAdd, charity);

    emit Transfer(sender, recipient, tTransferAmount);
}
