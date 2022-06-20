  function recordStatement(
    uint[] memory statementDataLayout,
    bytes memory statementData
  ) public onlyPrimaryOrOwner returns(bytes32) {
    bytes32 statementId = generateStatementId();

    recordStatementStrings(statementId, statementDataLayout, statementData);
    dataStore.createBool(keccak256(abi.encodePacked(statementId)), true);

    emit NewStatementEvent(buildingPermitId, statementId);
  }

  function recordStatementStrings(
    bytes32 statementId,
    uint[] memory statementDataLayout,
    bytes memory statementData) internal {
    string[] memory infos = parseStatementStrings(statementDataLayout, statementData);

    recordStatementString(statementId, "pcId", infos[0]);
    recordStatementString(statementId, "acquisitionDate", infos[1]);
    [...]
  }

  function parseStatementStrings(
    uint[] memory statementDataLayout,
    bytes memory statementData) internal pure returns(string[] memory) {
    string[] memory res = new string[](statementDataLayout.length - 1);
    uint bytePos = statementDataLayout[0] * 32;
    uint resLength = res.length;
    for(uint i = 0; i < resLength; i++) {
      bytes memory strBytes = new bytes(statementDataLayout[i+1]);
      uint strBytesLength = strBytes.length;
      for(uint j = 0; j < strBytesLength; j++) {
        strBytes[j] = statementData[bytePos];
        bytePos++;
      }
      res[i] = string(strBytes);
    }

    return res;
  }

