function multiplyByPi(uint256 num) public view returns(uint256) {
    uint256 scaledSolution = num.mul(1e18).mul(31416);
    return scaledSolution / 1e18
}
