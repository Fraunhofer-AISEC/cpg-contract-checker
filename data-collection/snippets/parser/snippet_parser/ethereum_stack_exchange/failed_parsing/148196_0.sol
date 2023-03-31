
    
    function isValidSignature(address signer, bytes memory signature)
        public
        view
        returns (bool)
    {
       
        bytes32 messageHash = keccack256(abi.encodePacked(***byte***(0x19), byte(0), address(this), signer));
        return ECDSA.recover(messageHash, signature) == signer;
    }
