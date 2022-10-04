  function bytes32ToBytes(bytes32 input) public pure returns (bytes memory) {
    bytes memory b = new bytes(32);
    assembly {
      mstore(add(b, 32), input) 
    }
    return b;
  }
