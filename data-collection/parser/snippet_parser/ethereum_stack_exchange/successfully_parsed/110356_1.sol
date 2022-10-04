

pragma solidity >=0.7.0 <0.9.0;

contract Test {
    
    string public state_x = "Hello";

    function testingShit() public {
        callOtherFunction(state_x);
    }
    
    function callOtherFunction(string storage _x) internal {
        _x = "Goodbye";
    }
    
}
