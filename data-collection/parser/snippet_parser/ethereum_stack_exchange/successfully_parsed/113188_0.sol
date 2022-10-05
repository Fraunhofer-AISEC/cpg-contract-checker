function hash(
    address[] memory addresses,
    uint256[] memory values,
    bytes[] memory data,
    bytes32 description
) public returns (uint256) {
    return uint256(keccak256(abi.encode(targets, values, data, description)));
}
