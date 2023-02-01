modifier checkSignature(uint8 _v,
        bytes32 _r,
        bytes32 _s){
        if (enableSignature) {
            address signer = ECDSA.recover(_hashTypedDataV4(keccak256(
                    abi.encode(COLLECT_MESSAGE, msg.sender, nonces[msg.sender]++)
                )), _v, _r, _s);
            require(signers[signer], "MISSION_CONTROL: INVALID_SIGNATURE");
        }
        _;
    }
