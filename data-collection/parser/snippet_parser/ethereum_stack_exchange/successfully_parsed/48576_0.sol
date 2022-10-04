function toBytes(uint256 x) returns (bytes b) {
    b = new bytes(32);
    assembly { mstore(add(b, 32), x) }
}
