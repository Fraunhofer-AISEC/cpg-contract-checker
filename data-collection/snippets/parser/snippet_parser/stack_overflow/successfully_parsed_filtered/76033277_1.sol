function myCreateToken() public payable {
        IHederaTokenService.TokenKey[]
            memory keys = new IHederaTokenService.TokenKey[](0);

        IHederaTokenService.Expiry memory expiry = IHederaTokenService.Expiry(
            0,
            address(this),
            8000000
        );

        IHederaTokenService.HederaToken memory token = IHederaTokenService
            .HederaToken(
                "MyToken",
                "MTT",
                address(this),
                "",
                true,
                10000000,
                false,
                keys,
                expiry
            );

        (int responseCode, ) = HederaTokenService.createFungibleToken(
            token,
            10000000,
            NUM_DECIMALS
        );

        require(responseCode == HederaResponseCodes.SUCCESS);
    }
