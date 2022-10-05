pragma solidity >=0.6.0 <0.9.0;

contract C {
    function f(unit value) public {
        uint defaultVal = 5;
        f(defaultVal, value);

    function f(uint key, uint value) public {
        
    }

    function g() public {
        
        f(2, 3);
    }
}
