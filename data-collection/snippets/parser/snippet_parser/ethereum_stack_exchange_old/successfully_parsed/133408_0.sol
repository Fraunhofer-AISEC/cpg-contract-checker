function calculatePurchaseReturn(
        uint256 _totalSupply,
        uint256 _depositAmount
    ) public pure returns (uint256) {
        uint256 newTotal = _totalSupply.add(_depositAmount);
        uint256 newPrice = (30 * ((newTotal * newTotal) / DECIMALS)) / 10000;

        return newPrice;
    }
