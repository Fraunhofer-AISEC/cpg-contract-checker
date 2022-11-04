bytes32[] memory keccakData = new bytes32[](data.length);
for (uint256 i = 0; i < data.length; i++) {
    keccakData[i] = keccak256(data[i]);
}
