function intToBytesToInt(int256 _input) public pure returns (int256) {
  bytes memory buffer = new bytes(32);
  uint offset = 32;

  assembly{
    mstore(add(buffer, offset), _input)
  }

  
  bytes memory b = buffer;

  

  bytes32 preI;

  assembly {
    preI := mload(add(buffer, offset))
  }

  
  int256 i = int256(preI);

  return i;
}
