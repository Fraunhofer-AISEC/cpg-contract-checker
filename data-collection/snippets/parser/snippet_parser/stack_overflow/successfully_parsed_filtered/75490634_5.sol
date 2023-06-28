function getSigner(string memory message, bytes memory sig) public view returns(address) {
   bytes32 messageHash = keccak256(abi.encodePacked(message));
   address signer = ECDSA.recover(messageHash, sig);
   return signer;
}
