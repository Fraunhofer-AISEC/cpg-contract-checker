contract Test {

    string public state_x = "Hello";

    function testingShit() public {
        callOtherFunction(bytes(state_x));
    }

    function callOtherFunction(bytes storage x) internal {
        x[0] = bytes1('W');
        x[1] = bytes1('o');
        x[2] = bytes1('r');
        x[3] = bytes1('l');
        x[4] = bytes1('d');
    }
}
