pragma solidity ^0.4.8;

    contract MyTest {

        string public publicKey;

        function setPublicKey(string _publicKey)
        {
            publicKey = _publicKey;
        }

        function getPublicKey() constant returns (string _publicKey) {
            return publicKey;
        }
    }
