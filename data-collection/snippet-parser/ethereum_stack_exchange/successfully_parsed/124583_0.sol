function saveRewards() internal {
        for (uint i = 0; i < farmerIndexes.length; i++) {
            farm.farmers[farmerIndexes[i]].rewards = farm.farmers[farmerIndexes[i]].rewards.add(calculateRewards(farmerIndexes[i]));
        }

        lastUpdate = block.timestamp;
    }
