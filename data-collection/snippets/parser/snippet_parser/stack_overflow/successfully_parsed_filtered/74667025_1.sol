        IHederaTokenService.TokenKey[]
            memory keys = new IHederaTokenService.TokenKey[](2);
        
        keys[0] = getSingleKey(
            KeyType.SUPPLY,
            KeyValueType.CONTRACT_ID,
            address(this)
        );
        keys[1] = getSingleKey(
            KeyType.PAUSE,
            KeyValueType.CONTRACT_ID,
            address(this)
        );

        IHederaTokenService.HederaToken memory token;
        token.name = _name;
        token.symbol = _symbol;
        token.treasury = address(this);
        token.memo = _memo;
        token.tokenSupplyType = true; 
        token.maxSupply = int64(int256(_maxSupply));
        token.freezeDefault = false;
        token.tokenKeys = keys;
        token.expiry = createAutoRenewExpiry(address(this), _autoRenewPeriod); 

        (int256 responseCode, address createdToken) = HederaTokenService
            .createNonFungibleToken(token);

        if (responseCode != HederaResponseCodes.SUCCESS) {
            revert("Failed to create non-fungible token");
        }

        tokenAddress = createdToken;

        (int256 response, uint64 newSupply, ) = HederaTokenService.mintToken(
            tokenAddress,
            uint64(amount),
            new bytes[](0)
        );

        (int256 response, , int64[] memory serialNumbers) = HederaTokenService
            .mintToken(tokenAddress, 0, metadata);
