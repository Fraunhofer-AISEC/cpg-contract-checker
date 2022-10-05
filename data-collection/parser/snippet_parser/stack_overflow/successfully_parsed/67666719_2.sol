  function _messageToRecover(address erc20Contract, address destination, uint256 value) private view returns (bytes32) {
    bytes32 hashedUnsignedMessage = generateMessageToSign(erc20Contract, destination, value);
    bytes memory message = bytes32_to_hstring(hashedUnsignedMessage);
    bytes memory prefix = "\x19Ethereum Signed Message:\n64";
    return keccak256(abi.encodePacked(prefix, message));
  }
