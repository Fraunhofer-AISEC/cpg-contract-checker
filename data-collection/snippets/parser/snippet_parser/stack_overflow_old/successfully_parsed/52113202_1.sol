pragma solidity ^0.4.0;

contract C {
    function f(uint key, uint value) public {
        
    }

    function h(uint value) public {
        f(123, value);
    }

    function g() public {
        
        f({value: 2, key: 3});
    }

    function i() public {
        h({value: 2});
    }
}
