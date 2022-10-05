function setRewardTokenForShareholder(address RWRD) external {
        require(customRewardsAllowed, "Contract: setRewardTokenForShareholder:: Custom Rewards arent allowed");
        
        
        uint256 existingBalance = balanceOf(msg.sender);
        require(existingBalance < thresholdForCustomRewards, "You do not have enough tokens to changce your RWRD");

        require(isContract(RWRD), "Contract: setRewardTokenForShareholder:: Address is a wallet, not a contract.");
        require(RWRD != address(this), "Contract: setRewardTokenForShareholder:: Cannot set reward token as this token due to Router limitations.");
        require(!distributor.isBlacklistedRwrdToken(RWRD), "Contract: setRewardTokenForShareholder:: Reward Token is blacklisted from being used as rewards.");

        distributor.setNewRewardForShareholder(msg.sender, RWRD);
    }
