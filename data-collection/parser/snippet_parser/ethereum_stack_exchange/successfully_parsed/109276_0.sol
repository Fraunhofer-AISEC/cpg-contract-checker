  function acceptPreCondition(
    bytes32, 
    bytes32 
  ) internal view {
    require(signatures[party1], 'Party 1 did not sign yet');
    require(signatures[party2], 'Party 2 did not sign yet');
  }
