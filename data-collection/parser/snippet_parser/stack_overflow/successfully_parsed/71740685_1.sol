function verify(bytes memory signature) public view returns (address) {
    bytes32 hash = keccak256(abi.encodePacked(msg.sender));
    bytes32 messageHash = hash.toEthSignedMessageHash();
    address signer = messageHash.recover(signature);
    return signer; 
}
