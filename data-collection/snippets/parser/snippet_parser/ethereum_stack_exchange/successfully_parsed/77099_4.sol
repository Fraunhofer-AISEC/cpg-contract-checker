function setBoolean(
    uint256 _packedBools,
    uint256 _boolNumber,
    bool _value
)
    public
    view
    returns (uint256)
{
    if (_value)
        return _packedBools | uint256(1) << _boolNumber;
    else
        return _packedBools & ~(uint256(1) << _boolNumber);
}
