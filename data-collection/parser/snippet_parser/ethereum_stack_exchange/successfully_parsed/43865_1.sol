contract Test {
    uint256 public integer = 100;
    bool[] public array;

    function fill_array() {
        while (integer > 0) {
            bool bit = (integer%2) != 0;
            uint256 quotient = integer/2;
            array.push(bit);
            integer = quotient;
        }
    }
}
