library ECVerify {
  function ecrecovery(bytes32 hash, bytes sig) public constant returns (address) {
    bytes32 r;
    bytes32 s;
    uint8 v;

    if (sig.length != 65) {
      return 0;
    }

    assembly {
      r := mload(add(sig, 32))
      s := mload(add(sig, 64))
      v := and(mload(add(sig, 65)), 255)
    }

    if (v < 27) {
      v += 27;
    }

    if (v != 27 && v != 28) {
      return 0;
    }

    return ecrecover(hash, v, r, s);
  }

  function ecverify(bytes32 hash, bytes sig, address signer) public constant returns (bool) {
    return signer == ecrecovery(hash, sig);
  }
}
