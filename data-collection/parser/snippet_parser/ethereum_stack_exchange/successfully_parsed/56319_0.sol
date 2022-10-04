
function toShortString(bytes32 _data)
  pure
  public
  returns (string)
{
  
  
  bytes memory _bytesContainer = new bytes(32);
  
  
  uint256 _charCount = 0;
  
  for (uint256 _bytesCounter = 0; _bytesCounter < 32; _bytesCounter++) {
    
    bytes1 _char = bytes1(bytes32(uint256(_data) * 2 ** (8 * _bytesCounter)));
    
    if (_char != 0) {
      
      _bytesContainer[_charCount] = _char;
      
      _charCount++;
    }
  }

  
  bytes memory _bytesContainerTrimmed = new bytes(_charCount);

  
  for (uint256 _charCounter = 0; _charCounter < _charCount; _charCounter++) {
    
    _bytesContainerTrimmed[_charCounter] = _bytesContainer[_charCounter];
  }

  
  return string(_bytesContainerTrimmed);
}
