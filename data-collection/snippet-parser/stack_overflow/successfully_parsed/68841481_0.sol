function addPhase(
    uint16 _phase,
    uint64 _originalId
  )
    public
    view
    returns (uint80)
  {
    return uint80(uint256(_phase) << 64 | _originalId);
  }
