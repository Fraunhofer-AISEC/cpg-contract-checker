contract Simple {
    uint public sum;
    function taker(uint _a, uint _b) public returns (uint) {
        sum = _a + _b;
        return sum;
    }
}
