pragma solidity 0.4.21;

contract ConstructorTest {
    function ConstructorTest(address parent) public {
        assert(parent != 0);
    }
}
