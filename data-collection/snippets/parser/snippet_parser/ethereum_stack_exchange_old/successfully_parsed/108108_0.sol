 
 function getSlice(string memory source, uint startPos, uint numChars) public pure returns (string memory) {
   uint ustartPos = uint(startPos -1);
   uint _numChars = uint(numChars);

    bytes memory sourcebytes = bytes(source);
   if (_numChars==0) {
       _numChars = ((sourcebytes.length - ustartPos) + 1);
   }
  
  bytes memory result = new bytes(_numChars);     

  for (uint i = 0; i<_numChars; i++) {
      result[i] = sourcebytes[i + ustartPos];
  }
  return string(result);
}
