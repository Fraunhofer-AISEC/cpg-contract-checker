    function splitSignature(bytes memory sig)
        pure
        internal
        returns (uint8 v, bytes32 r, bytes32 s)
    {
        require(sig.length == 65 , "invalid length");

        assembly {
            r := mload(add(sig, 32))
            s := mload(add(sig, 64))
            v := byte(0, mload(add(sig, 96)))
        }
        if (v < 27) {
            v += 27;
        }

        require(v == 27 || v == 28 , "value of v ");
        return (v, r, s);
    }

    function recoverSigner(bytes32 message, bytes memory sig)
        internal 
        pure
        returns (address)
    {
        (uint8 v, bytes32 r, bytes32 s) = splitSignature(sig);
        return ecrecover(message, v, r, s);
    }

