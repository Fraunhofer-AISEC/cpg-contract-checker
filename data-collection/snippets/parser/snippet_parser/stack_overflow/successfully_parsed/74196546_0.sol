contract test {
    function calculatePrice(uint a, uint b) public pure  returns (uint) {
        return (a * (b / 100));
    }

    function calculatePrice2() public pure  returns (uint) {
        return (80 * (60 / 100));
    }
}
