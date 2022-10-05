   function sendTokensFromCustomerToRetailer(address retailer, address customer, uint256 tokens) public onlyOwner {
        increaseAllowance(customer, tokens * 10 ** uint256(decimals()));
        transferFrom(customer, retailer, tokens * 10 ** uint256(decimals()));
        updateRewardableBalancePerAddress(customer);
        updateRewardableBalancePerAddress(retailer);
    }
