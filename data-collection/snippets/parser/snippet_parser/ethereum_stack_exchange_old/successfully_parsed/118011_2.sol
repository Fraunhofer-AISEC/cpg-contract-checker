uint256[1] private x;
function test(uint256 i) external returns (uint256) {
    x[i] = 5;
    return x[i];
}
