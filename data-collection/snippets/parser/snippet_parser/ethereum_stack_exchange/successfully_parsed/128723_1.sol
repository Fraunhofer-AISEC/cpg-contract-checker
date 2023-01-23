    function calculateUserBalanceToSwap(
        uint256 currentBalance,
        uint256 previousBalance,
        uint256 orderPercentageToSwap
    ) public pure returns (uint256) {
        return (
            ABDKMath64x64.toUInt(
                ABDKMath64x64.divu(
                    (currentBalance - previousBalance) * orderPercentageToSwap,
                    100
                )
            )
        );
    }
