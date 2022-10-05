uint256[1] private x;
function test() external returns (uint256) {
    x[0] = 5;
    return x[0];
}
