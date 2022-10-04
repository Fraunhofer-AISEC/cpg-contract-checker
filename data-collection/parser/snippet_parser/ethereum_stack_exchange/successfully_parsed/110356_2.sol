contract Test {
    
    function testing() public pure returns (string memory) {
        string memory x = "Hello";
        callOtherFunction(bytes(x));

        return string(x);
    }

    function callOtherFunction(bytes memory x) internal pure {
        x[0] = bytes1('W');
        x[1] = bytes1('o');
        x[2] = bytes1('r');
        x[3] = bytes1('l');
        x[4] = bytes1('d');
    }
}
