
function toUint(bytes _data, uint256 _offset, uint256 _length)
internal pure
returns(uint256 _result) {
    require(_offset >= 0);
    require(_length > 0);
    require((_offset + _length) <= _data.length);
    uint256 _segment = _offset + _length;
    uint256 count = 0;
    for (uint256 i = _segment; i > _offset ; i--) {
        _result |= uint256(_data[i-1]) << ((count++)*8);
    }
}
