contract User {
    string publicKey;

    function setPublicKey(string _publicKey)
    {
        publicKey = _publicKey;
    }

    function getPublicKey() returns (string) {
        return publicKey;
    }

 }
