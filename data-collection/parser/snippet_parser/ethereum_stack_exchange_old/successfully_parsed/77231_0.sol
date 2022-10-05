contract ecrecover {
    function testRecovery(bytes32 hash, bytes signature) returns (address) {
    bytes32 r;
    bytes32 s;
    uint8 v;
    assembly {
      r := mload(add(signature, 32))
      s := mload(add(signature, 64))
      v := and(mload(add(signature, 65)), 255)
    }
    if (v < 27) v += 27;
    address addr = ecrecover(hash, v, r, s);
    return addr;
    }
}