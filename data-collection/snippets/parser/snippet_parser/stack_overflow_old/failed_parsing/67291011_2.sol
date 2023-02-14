_rOwned[_msgSender()] = _tTotransfer; 
emit Transfer(address(0), _msgSender(), _tTotransfer);

_rOwned[_devsWallet] = _tToDevs;
emit Transfer(address(0), _devsWallet, _tToDevs);

rOwned[_marketingWallet] = _tToMarketing;
emit Transfer(address(0), _marketingWallet, _tToMarketing);

rOwned[_apesWallet] = _tToApes;
emit Transfer(address(0), _apesWallet, _tToApes);
