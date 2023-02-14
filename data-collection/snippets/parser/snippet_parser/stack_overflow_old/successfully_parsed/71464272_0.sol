function rebase(uint256 epoch, int256 supplyDelta)
    external
    onlyOwner
    returns (uint256)
{
    require(!inSwap, "Try again");
    if (supplyDelta == 0) {
        emit LogRebase(epoch, _totalSupply);
        return _totalSupply;
    }
    if (supplyDelta < 0) {
        _totalSupply = _totalSupply.sub(uint256(-supplyDelta));
    } else {
        _totalSupply = _totalSupply.add(uint256(supplyDelta));
    }
    if (_totalSupply > MAX_SUPPLY) {
        _totalSupply = MAX_SUPPLY;
    }
    _gonsPerFragment = TOTAL_GONS.div(_totalSupply);
    pairContract.sync();
    emit LogRebase(epoch, _totalSupply);
    return _totalSupply;
}
