
pragma solidity ^0.4.0;

contract C {
    uint someVariable;
    uint[] data;

    function f() public {
        uint[] x;
        x.push(2);
        data = x;
    }
}
