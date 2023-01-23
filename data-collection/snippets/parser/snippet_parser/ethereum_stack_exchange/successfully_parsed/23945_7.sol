    modifier requiresWhitelist(
        bytes calldata signature,
        uint256 nonce
    ) {
        
        
        
        bytes32 structHash = keccak256(
            abi.encode(MINTER_TYPEHASH, msg.sender, nonce)
        );
        bytes32 digest = toTypedMessageHash(structHash); 
        require(!signatureUsed[digest], "signature used");
        signatureUsed[digest] = true;
        
        
        
        
        address recoveredAddress = digest.recover(signature);
        require(
            hasRole(WHITELISTING_ROLE, recoveredAddress),
            "Invalid Signature"
        );
        _;
    }
