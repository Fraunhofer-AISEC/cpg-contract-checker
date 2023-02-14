function plantSeeds(address ref) public payable {
        require(initialized);
        uint256 seedsBought = calculateSeedBuy(msg.value,SafeMath.sub(address(this).balance,msg.value));
        seedsBought = SafeMath.sub(seedsBought,devFee(seedsBought));
        uint256 fee = devFee(msg.value);
        recAddr.transfer(fee);
        claimedSeeds[msg.sender] = SafeMath.add(claimedSeeds[msg.sender],seedsBought);
        replantSeeds(ref);
    }
