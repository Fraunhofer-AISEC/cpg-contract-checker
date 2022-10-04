contract test {

    function calc(uint256 a, uint256 b) private returns (uint256) {
        return a + b;
    }

    function test(uint256 a, uint256 b) public returns (uint256) {
        return calc(a, b);
    }
}
