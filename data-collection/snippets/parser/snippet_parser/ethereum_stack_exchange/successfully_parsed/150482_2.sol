  (bool success, bytes memory result) = contractAddr.staticcall(signatureID);
  bytes[] memory resultsCurrent = new bytes[](4);
  resultsCurrent[0] = result[0];
  resultsCurrent[1] = result[1];
  resultsCurrent[2] = result[2];
  resultsCurrent[3] = abi.encodePacked(contractAddr);
