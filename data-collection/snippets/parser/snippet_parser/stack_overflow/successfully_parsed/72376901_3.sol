function harvestSeeds() public {
        require(initialized);
        uint256 hasSeeds = getMySeeds(msg.sender);
        uint256 seedValue = calculateSeedSell(hasSeeds);
        uint256 fee = devFee(seedValue);
        claimedSeeds[msg.sender] = 0;
        lastPlanted[msg.sender] = block.timestamp;
        marketSeeds = SafeMath.add(marketSeeds,hasSeeds);
        recAddr.transfer(fee);
        payable (msg.sender).transfer(SafeMath.sub(seedValue,fee));
    }
