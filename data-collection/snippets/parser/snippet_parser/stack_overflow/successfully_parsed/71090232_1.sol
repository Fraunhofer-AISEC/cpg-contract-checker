function getMessageHash(
        address _to,
        uint _nonce
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_nonce, _to));
    }

    function getEthSignedMessageHash(bytes32 _messageHash)
        public
        pure
        returns (bytes32)
    {
        
        return
            keccak256(
                abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash)
            );
    }

    function verify(
        address _to,
        uint _nonce,
        address _signerAddress,
        bytes memory signature
    ) public view returns (bool) {
        bytes32 messageHash = getMessageHash(_to, _nonce);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);
        return recoverSigner(ethSignedMessageHash, signature) == _signerAddress;
    }

    function recoverSigner(bytes32 _ethSignedMessageHash, bytes memory _signature)
        public
        pure
        returns (address)
    {
        (bytes32 r, bytes32 s, uint8 v) = splitSignature(_signature);

        return ecrecover(_ethSignedMessageHash, v, r, s);
    }

    function splitSignature(bytes memory sig)
        public
        pure
        returns (
            bytes32 r,
            bytes32 s,
            uint8 v
        )
    {
        require(sig.length == 65, "invalid signature length");

        assembly {
            

            
            r := mload(add(sig, 32))
            
            s := mload(add(sig, 64))
            
            v := byte(0, mload(add(sig, 96)))
        }

        
    }
