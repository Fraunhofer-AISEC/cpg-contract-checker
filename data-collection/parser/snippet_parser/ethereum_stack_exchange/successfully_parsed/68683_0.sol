  function computePairId(bytes20 base, bytes20 quote) public view returns (bytes4) {

    bytes32 pairHash = sha256(abi.encodePacked(base ^ quote));

    bytes4 pairId;
    pairId[0] = pairHash[28];
    pairId[1] = pairHash[29];
    pairId[2] = pairHash[30];
    pairId[3] = pairHash[31];
    return pairId;
  }
