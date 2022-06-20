   function hashOperation(
    address target,
    uint256 value,
    bytes calldata data,
    bytes32 predecessor,
    bytes32 salt
) public pure virtual returns (bytes32 hash) {
    return keccak256(abi.encode(target, value, data, predecessor, salt));
}
