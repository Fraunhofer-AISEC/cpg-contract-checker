function rightShift(uint256 x) public pure returns (uint256 result) {
    assembly {
        result := shr(1, x)
    }
}
