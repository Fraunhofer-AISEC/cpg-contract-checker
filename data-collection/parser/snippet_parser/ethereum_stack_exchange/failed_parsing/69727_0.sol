event LogSet(bytes32 keyA, bytes32 keyB, bytes32 value);

function set(bytes32 keyA, bytes32 keyB, bytes32 value) public {
  myMap(multikey(keyA, keyB) = value;
  emit Log(keyA, keyB, value);
}

function multikey(bytes32 keyA, bytes32 keyB) public pure returns(bytes32) {
  return keccak256(abi.encodedPacked(keyA, keyB));
}
