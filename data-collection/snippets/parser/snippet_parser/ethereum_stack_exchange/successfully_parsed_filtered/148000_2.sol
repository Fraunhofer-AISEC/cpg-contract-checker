 function getETHSignedMessage(bytes32 _messageHash) public pure returns (bytes32) {
    return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash));
  }

function recover(bytes32 _ethSignedMessage, bytes memory _sig) public pure returns (address) {
  (bytes32 r, bytes32 s, uint8 v ) = _split(_sig);
  return ecrecover(_ethSignedMessage, v, r, s);
}
