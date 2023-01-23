    function _getAmountFromPercent(uint256 amount, uint256 percentBips) internal pure returns(uint256) {
       unchecked { return (amount * percentBips) / BASIS_POINTS_FACTOR; }
    }
