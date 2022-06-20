  function computePairId(bytes20 base, bytes20 quote) public pure returns (bytes4) {

    bytes32 pairHash = sha256(abi.encodePacked(base ^ quote));

    bytes4 pairId;
    bytes4 x = bytes4(0xff000000);

    pairId ^= (x & pairHash[28]);
    pairId ^= (x & pairHash[29]) >> 8;
    pairId ^= (x & pairHash[30]) >> 16;
    pairId ^= (x & pairHash[31]) >> 24;

    return pairId;
  }
