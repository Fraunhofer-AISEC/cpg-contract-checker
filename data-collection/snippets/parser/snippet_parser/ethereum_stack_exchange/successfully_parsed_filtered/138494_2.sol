function recover(
      bytes32 hash,
      uint8 v,
      bytes32 r,
      bytes32 s
  ) internal pure returns (address) {
      (address recovered, RecoverError error) = tryRecover(hash, v, r, s);
      _throwError(error);
      return recovered;
  }
