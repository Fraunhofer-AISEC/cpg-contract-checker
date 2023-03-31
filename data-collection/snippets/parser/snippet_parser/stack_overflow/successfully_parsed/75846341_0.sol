function _addTokenLiquidityToBalancerPool(bytes32 poolId, address sender, uint256[] memory amountsIn, uint256 tokenIndex, uint256 minBptAmountOut) external {
        require(amountsIn[tokenIndex] > 0, "Amount must be greater than 0");
        (IERC20[] memory tokens, , ) = vault.getPoolTokens(poolId);
        
        _require(amountsIn.length == tokens.length, Errors.INPUT_LENGTH_MISMATCH);
        
        bytes memory userData = abi.encode(StablePoolUserData.JoinKind.EXACT_TOKENS_IN_FOR_BPT_OUT, amountsIn, minBptAmountOut);

        IVault.JoinPoolRequest memory requests = IVault.JoinPoolRequest({
            assets: _asIAsset(tokens),
            maxAmountsIn: amountsIn,
            userData: userData,
            fromInternalBalance: false
        });
        totalDepositByUser[msg.sender] += amountsIn[tokenIndex];

        
        vault.joinPool(poolId, sender, address(this), requests);
    }
