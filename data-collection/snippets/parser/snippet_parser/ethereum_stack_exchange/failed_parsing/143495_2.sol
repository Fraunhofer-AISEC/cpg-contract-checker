import "./path/to/Arithmetic.sol";
...        

function _getAmountFromPercent(uint256 amount, uint256 percentBips) internal pure returns(uint256) {
        return Arithmetic.overflowResistantFraction(amount , percentBips, BASIS_POINTS_FACTOR);
    }
