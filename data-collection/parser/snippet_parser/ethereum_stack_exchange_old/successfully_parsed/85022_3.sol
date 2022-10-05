contract Test {
    uint256 times_called;

    function tc () public returns (uint256) {
        times_called += 1;
        return times_called;
    }
}
