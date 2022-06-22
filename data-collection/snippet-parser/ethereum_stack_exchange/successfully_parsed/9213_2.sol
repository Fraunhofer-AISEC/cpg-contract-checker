pragma solidity ^0.4.0;

contract Test {
    function testit(address a) {
        if (!a.send(123))
            throw;
    }
}
