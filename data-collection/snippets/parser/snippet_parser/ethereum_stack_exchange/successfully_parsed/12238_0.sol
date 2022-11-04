pragma solidity ^0.4.8;

contract Test {
    uint248 public value;

    function Test() {
        value = 123;
    }

    function () payable {
        value = uint248(msg.value);
    }
}
