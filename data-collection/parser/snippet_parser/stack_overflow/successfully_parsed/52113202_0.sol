pragma solidity ^0.4.0;

contract C {
    function f(uint key, uint value) public {
        
    }

    function g() public {
        
        f({value: 2, key: 3});
    }
}
