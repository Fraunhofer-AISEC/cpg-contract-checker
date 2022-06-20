import "./ABDKMath64x64.sol";

using ABDKMath64x64 for int128;


    function calculateUserSwapShare(
        uint256 totalToken,
        uint256 userBalanceToSwap,
        uint256 totalAmount
    ) public pure returns (uint256) {
        return (
            ABDKMath64x64.toUInt(
                ABDKMath64x64.divu(totalToken * userBalanceToSwap, totalAmount)
            )
        );
    }
