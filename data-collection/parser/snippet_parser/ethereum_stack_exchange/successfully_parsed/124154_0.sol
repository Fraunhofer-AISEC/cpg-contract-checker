    function executeMetaTransaction(
    address userAddress,
    bytes memory functionSignature,
    bytes32 sigR,
    bytes32 sigS,
    uint8 sigV
  ) public payable returns (bytes memory) {
    MetaTransaction memory metaTx = MetaTransaction({
      nonce: nonces[userAddress],
      from: userAddress,
      functionSignature: functionSignature
    });
    require(
      verify(userAddress, metaTx, sigR, sigS, sigV),
      "Signer and signature do not match"
    );

    
    nonces[userAddress] = nonces[userAddress] + 1;

    emit MetaTransactionExecuted(
      userAddress,
      payable(msg.sender),
      functionSignature
    );

    
    (bool success, bytes memory returnData) = address(this).call(
      abi.encodePacked(functionSignature, userAddress)
    );
    require(success, "Function call not successful");

    return returnData;
  }
