function verify(address _signer, string memory _message, bytes memory _sig) external pure returns (bool)
{
    bytes32 messageHash = getMessageHash(_message);
    bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);
    return recover(ethSignedMessageHash, _sig) == _signer;
}
