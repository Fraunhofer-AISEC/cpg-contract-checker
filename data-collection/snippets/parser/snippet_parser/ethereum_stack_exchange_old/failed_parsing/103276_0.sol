function genRandomNumbers(uint256 salt) public pure returns (uint256) {
    uint256 seed = salt + block.timestamp;
    return uint256(keccak256(abi.encodePacked(seed));
