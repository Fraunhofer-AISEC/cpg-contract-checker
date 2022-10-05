pragma solidity ^0.4.8;

contract c {
    event trace(bytes32 x, bytes16 a, bytes16 b);

    function foo(bytes32 source) {
        bytes16[2] memory y = [bytes16(0), 0];
        assembly {
            mstore(y, source)
            mstore(add(y, 16), source)
        }
        trace(source, y[0], y[1]);
    }
}
