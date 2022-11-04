function read_pc() external view returns (uint256 result) {
    assembly {
        result := pc()
    }
}
