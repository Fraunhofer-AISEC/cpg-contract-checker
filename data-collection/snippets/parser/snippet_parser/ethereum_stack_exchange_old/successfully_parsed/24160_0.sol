contract User {
    string publicKey;

    function setPublicKey(string _publicKey)
        onlyOwner
    {
        publicKey = _publicKey;
    }

    function getPublicKey() returns (string _publicKey) {
        return publicKey;
    }

}
