contract User {
    bytes32 publicKey;

    function setPublicKey(bytes32 _publicKey)
        onlyOwner
    {
        publicKey = _publicKey;
    }

    function getPublicKey() returns (bytes32 _publicKey) {
        return publicKey;
    }

}
