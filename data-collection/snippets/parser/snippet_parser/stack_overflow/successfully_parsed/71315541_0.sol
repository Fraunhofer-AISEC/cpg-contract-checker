function _transferStandard(address sender, address recipient, uint256 tAmount) private {
        require(balanceOf(sender) > tAmount, "Insuficient balance for transaction.");
        (uint256 tTransferAmount, uint256 fee) = _getValues(tAmount);
        _tOwned[sender] = _tOwned[sender].sub(tAmount);
        _tOwned[devWallet] = _tOwned[devWallet].add(fee);
        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);       
        emit Transfer(sender, recipient, tTransferAmount);
    }
