contract Token {
    function getFive() public returns (uint) {
        return 5;
    }
}

contract MyToken is Token {
    function getSix() public returns (uint) {
        return 6;
    }
}
