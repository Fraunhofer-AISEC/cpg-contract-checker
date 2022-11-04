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
        keccak256(
            abi.encodePacked(
                "\x19Ethereum Signed Message: \n32",
                _messageHash
            )
        );
}

function recoverSigner(
    bytes32 _ethSignedMessageHash,
    bytes memory _signature
) public pure returns (address) {
    (bytes32 r, bytes32 s, uint8 v) = splitSignature(_signature);
    return ecrecover(_ethSignedMessageHash, v, r, s);
}

function verify(
    address _signer,
    uint256 _amount,
    string memory _message,
    uint256 _nonce,
    bytes memory _signature
) public pure returns (bool) {
    bytes32 messageHash = getMessageHash(_amount, _message, _nonce);
    bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);
    return recoverSigner(ethSignedMessageHash, _signature) == _signer;
}

function splitSignature(bytes memory _sig)
    public
    pure
    returns (
        bytes32 r,
        bytes32 s,
        uint8 v
    )
{
    require(_sig.length == 65, "Invalid signature length");
    assembly {
        r := mload(add(_sig, 32))
        s := mload(add(_sig, 64))
        v := byte(0, mload(add(_sig, 96)))
    }
}
