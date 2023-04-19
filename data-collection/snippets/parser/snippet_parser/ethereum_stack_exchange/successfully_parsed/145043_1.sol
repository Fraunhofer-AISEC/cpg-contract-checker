function getOffset (uint256 param, uint256[] calldata arr) external pure returns (uint256 offset) {
    assembly {
        offset := arr.offset
    }
}
