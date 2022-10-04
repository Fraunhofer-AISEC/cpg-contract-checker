function coreRebase(uint256 supplyDelta) private returns (uint256) {
    uint256 epoch = block.timestamp;

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

    nextRebase = epoch + rebaseFrequency;

    emit LogRebase(epoch, _totalSupply);
    return _totalSupply;
  }
