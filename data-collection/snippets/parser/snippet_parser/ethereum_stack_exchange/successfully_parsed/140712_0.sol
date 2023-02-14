function claim(
        address token,          
        bytes32 txId,           
        address to,             
        uint256 value,          
        uint256 fromChainId,    
        bytes[] memory sig      
    ) 
        external
        notFrozen
    {
        require(!isTxProcessed[fromChainId][txId], "Transaction already processed");
        Token memory pair = tokenPair[fromChainId][token];
        require(pair.token != address(0), "There is no pair");
        isTxProcessed[fromChainId][txId] = true;
        address must = requiredAuthority;
        bytes32 messageHash = keccak256(abi.encodePacked(token, to, value, txId, fromChainId, block.chainid));
        messageHash = prefixed(messageHash);
        uint256 uniqSig;
        uint256 set;    
        for (uint i = 0; i < sig.length; i++) {
            address authority = recoverSigner(messageHash, sig[i]);
            if (authority == must) must = address(0);
            uint256 index = authorities.indexOf(authority);
            uint256 mask = 1 << index;
            if (index != 0 && (set & mask) == 0 ) {
                set |= mask;
                uniqSig++;
            }
        }
        require(threshold <= uniqSig, "Require more signatures");
        require(must == address(0), "The required authority does not sign");

        if (token <= MAX_NATIVE_COINS) {
            to.safeTransferETH(value);
        } else {
            if(pair.isWrapped) {
                IBEP20TokenCloned(token).mint(to, value);
            } else {
                tokenDeposits[token] -= value;
                token.safeTransfer(to, value);
            }
        }
        emit Claim(token, to, value, txId, fromChainId, pair.token);
    }
