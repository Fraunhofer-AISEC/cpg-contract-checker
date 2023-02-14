    modifier onlyValidTokenId(bytes32 composedTokenId) {
        bytes16[2] memory decomposedTokenId = _decomposeTokenId(composedTokenId);
        
        uint256 composedTokenIdAsNumber = uint256(composedTokenId);
        if (composedTokenIdAsNumber == 0 || composedTokenIdAsNumber > collectionTokenSupplyCap(decomposedTokenId[0])) {
            revert CardTokenInvalidTokenId(composedTokenId);
        }

        _;
    }
