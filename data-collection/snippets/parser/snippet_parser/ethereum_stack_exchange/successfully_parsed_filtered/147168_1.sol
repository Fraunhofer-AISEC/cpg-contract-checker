function a(int256 x) pure returns (uint256 result) {
    assembly {
        result := sdiv(sub(0, x), x) 
    }
}
