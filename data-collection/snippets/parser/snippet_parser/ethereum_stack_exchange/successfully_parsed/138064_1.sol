function getMessageHash(
    uint256 _amount,
    string memory _message,
    uint256 _nonce
) public pure returns (bytes32) {
    return keccak256(abi.encodePacked(_amount, _message, _nonce));
}

function getEthSignedMessageHash(bytes32 _messageHash)
    public
    pure
    returns (bytes32)
{
    return
        keccak256(abi.encodePacked("\x19Ethereum Signed Message: \n32", _messageHash));
}
