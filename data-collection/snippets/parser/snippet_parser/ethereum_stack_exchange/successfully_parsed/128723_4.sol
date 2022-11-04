    function calculateUserSwapShare(
        uint256 totalToken,
        uint256 userBalanceToSwap,
        uint256 totalAmount
    ) public pure returns (uint256) {
        return ((totalToken * userBalanceToSwap) / totalAmount);
    }
