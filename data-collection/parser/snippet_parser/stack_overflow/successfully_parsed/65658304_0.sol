  constructor(
    IVerifier _verifier,
    uint256 _denomination,
    uint32 _merkleTreeHeight,
    address _operator
  ) MerkleTreeWithHistory(_merkleTreeHeight) public {
    require(_denomination > 0, "denomination should be greater than 0");
    verifier = _verifier;
    operator = _operator;
    denomination = _denomination;
  }
