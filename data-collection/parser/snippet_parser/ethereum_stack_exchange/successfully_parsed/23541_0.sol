pragma solidity ^0.4.9;

contract ShouldNotCompile {
    address addr;
    function getSender() constant returns (address) {
        addr = msg.sender;
        return addr;
    }
}
