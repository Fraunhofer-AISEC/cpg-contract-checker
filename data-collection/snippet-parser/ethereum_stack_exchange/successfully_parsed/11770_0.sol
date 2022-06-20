pragma solidity ^0.4.11;

contract VariableLength {

    event LogTest(bytes b);

    function test(bytes b) public returns(bool success) {
        LogTest(b);
        return true;
    }
}
