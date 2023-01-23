contract B {
    function testb() public{ }
}
contract C{
    function testc() public{ }
}

contract D is B,C {
    function testd() public{ }
}
