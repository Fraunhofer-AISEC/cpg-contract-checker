function provideLiquidity(address inputToken, uint256 amount)
        external
        override
        onlyValidAddress(inputToken)
        whenNotPaused
        returns (uint256) {}
