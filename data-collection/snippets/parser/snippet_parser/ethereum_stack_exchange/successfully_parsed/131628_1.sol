function splitTransfer(address firstReceiver ,address secondReceiver,  uint256 amount) public virtual returns (bool) {
        address owner = _msgSender();
        _transfer(owner, firstReceiver, amount* 70 / 100);
        _transfer(owner, secondReceiver, amount* 30 / 100);
        return true;
    }
