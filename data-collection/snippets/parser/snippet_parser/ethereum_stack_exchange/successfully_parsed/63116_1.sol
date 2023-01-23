interface InterfaceTest{
    function testInterface() external pure returns(uint);
}

contract InterfaceContract is InterfaceTest {
    function testInterface() external pure returns(uint) {
        return 9;
    }
}
