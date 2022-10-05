    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        randomResult = randomness.mod(20).add(1);
    }
