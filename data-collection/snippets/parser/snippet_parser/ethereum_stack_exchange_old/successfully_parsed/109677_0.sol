pragma solidity ^0.8.0;

contract Assembly {
    function f() public {
        uint8[3] memory a = [1, 2, 3];
        delete a;
    }
}
