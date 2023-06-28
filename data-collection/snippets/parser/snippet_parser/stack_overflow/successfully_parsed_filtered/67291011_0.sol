constructor () public payable{
    uint256 _tTotransfer = _tTotal;

    uint256 _tToDevs = (_tTotal.mul(12)).div(100);
    _tTotransfer = _tTotransfer.sub((_tTotal.mul(12)).div(100));

    uint256 _tToMarketing = (_tTotal.mul(5)).div(100);
    _tTotransfer = _tTotransfer.sub((_tTotal.mul(5)).div(100));

    uint256 _tToApes = (_tTotal.mul(3)).div(100);
    _tTotransfer = _tTotransfer.sub((_tTotal.mul(3)).div(100));

    _rOwned[_msgSender()] = _rTotal;

    emit Transfer(address(0), _msgSender(), _tTotransfer); 
    emit Transfer(address(0), _devsWallet, _tToDevs); 
    emit Transfer(address(0), _marketingWallet, _tToMarketing); 
    emit Transfer(address(0), _apesWallet, _tToApes);
    
}
