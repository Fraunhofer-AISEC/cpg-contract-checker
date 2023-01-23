function fulfillRandomness(bytes32 requestId, uint256 randomness) external override {
        uint256 d6Result = randomness.mod(100).add(1);
        emit RequestRandomnessFulfilled(requestId, randomness);
    }

