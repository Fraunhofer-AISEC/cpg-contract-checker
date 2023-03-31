  function verifyLendingSig(
    uint256 _id,
    uint256 _tokenId,
    uint256 _price,
    uint256 _expiredAt,
    bytes calldata _signature
  ) public view {
    bytes32 criteriaMessageHash = keccak256(
      abi.encodePacked(_id, _tokenId, _price, _expiredAt)
    );
    bytes32 ethSignedMessageHash = ECDSA.toEthSignedMessageHash(
      criteriaMessageHash
    );

    require(
      ECDSA.recover(ethSignedMessageHash, _signature) == signer,
      "invalid signature"
    );
  }
