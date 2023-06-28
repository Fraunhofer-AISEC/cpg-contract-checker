
function verify(string memory message, bytes memory _signature) public pure returns (address){
    bytes memory messageEncodedPacked = abi.encodePacked(message);

    bytes32 ethSignedMessageHash = ECDSA.toEthSignedMessageHash(messageEncodedPacked);
    address signer = ECDSA.recover(ethSignedMessageHash, _signature);

    return signer;
}
