IHederaTokenService.TokenKey[]
        memory keys = new IHederaTokenService.TokenKey[](1);
    
    keys[0] = getSingleKey(
        KeyType.SUPPLY,
        KeyValueType.CONTRACT_ID,
        address(this)
    );

    IHederaTokenService.HederaToken memory token;
    token.name = _name;
    token.symbol = _symbol;
    token.treasury = address(this);
    token.memo = _memo;
    token.tokenSupplyType = true; 
    token.maxSupply = _maxSupply;
    token.freezeDefault = false;
    token.tokenKeys = keys;
    token.expiry = createAutoRenewExpiry(address(this), _autoRenewPeriod); 

    (int256 responseCode, address createdToken) = HederaTokenService
        .createFungibleToken(token, 0, _decimals);

    if (responseCode != HederaResponseCodes.SUCCESS) {
        revert("Failed to create fungible token");
    }

    tokenAddress = createdToken;

    (int256 response, uint64 newSupply, ) = HederaTokenService.mintToken(
        tokenAddress,
        uint64(amount),
        new bytes[](0)
    );
