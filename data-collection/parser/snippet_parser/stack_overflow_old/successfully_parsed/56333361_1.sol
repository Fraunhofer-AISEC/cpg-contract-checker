function getAllFutureOperations() public onlyOwner returns (uint256[] dates, uint256[] prices, uint256[] amounts, string[] names) {
        return futureOperations;
    }
