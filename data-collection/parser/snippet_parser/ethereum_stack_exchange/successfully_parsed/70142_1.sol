contract D {
    address constant a = 0x1111111111111111111111111111111111111111;

    function get() external pure returns (address) {
        return a;
    }
}
