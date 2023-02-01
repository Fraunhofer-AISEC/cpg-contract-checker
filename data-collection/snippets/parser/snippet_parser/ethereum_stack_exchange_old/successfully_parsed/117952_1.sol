uint256 public randomResult;

function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
    randomResult = (randomness % 50) + 1;
}
