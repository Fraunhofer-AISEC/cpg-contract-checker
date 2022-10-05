pragma solidity ^0.4.21;

contract Calculator {
    uint8 public result = 0;

    function add(uint8 value) public {
        result = result + value;
    }
}
