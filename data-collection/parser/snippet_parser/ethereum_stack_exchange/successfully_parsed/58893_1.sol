function readProduct(uint256 u) external view returns (bytes32 name) {
    bool status;
    (name, status) = p.productStructs(u);
    return name;
}
