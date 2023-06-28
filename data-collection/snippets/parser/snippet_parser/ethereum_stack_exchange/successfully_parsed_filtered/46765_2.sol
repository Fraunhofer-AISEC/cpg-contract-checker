function setTokenOffering(address offeringAddr, uint256 amountForSale) external onlyOwner onlyTokenOfferingAddrNotSet {
        require(!transferEnabled);

        uint256 amount = (amountForSale == 0) ? TokenAllowance : amountForSale;
        require(amount <= TokenAllowance);

        approve(offeringAddr, amount);
        tokenAllowanceAddr = offeringAddr;

    }
