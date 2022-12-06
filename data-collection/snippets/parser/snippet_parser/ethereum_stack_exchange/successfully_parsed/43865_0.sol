contract Test {
    uint256 public integer = 100;
    uint256[] public array;

    function fill_array() {
        while (integer > 0) {
            uint256 bit = integer%2;
            uint256 quotient = integer/2;
            array.push(bit);
            integer = quotient;
        }
    }
}
