constructor(
        address[] memory payees,
        uint256[] memory shares,
        address[] memory addresses,
        uint256 swapAmount
    ) ERC20("Token", "TOKEN") PaymentSplitter(payees, shares) {

        require(addresses.length == 5, "Count of Addresses must be 5");

        treasuryPool = addresses[0];
        distributionPool = addresses[1];
        marketingPool = addresses[2];
        expensePool = addresses[3];
        cashoutPool = addresses[4];

        for (uint256 i = 0; i < 5; i++)
            _isExcludedFromFee[addresses[i]] = true;

        require(expensePool != address(0) && distributionPool != address(0), "FUTUR & REWARD ADDRESS CANNOT BE ZERO");
