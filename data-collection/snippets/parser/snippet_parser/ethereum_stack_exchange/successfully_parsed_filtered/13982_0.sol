pragma solidity ^0.4.6;

contract Mapping {
    mapping(address => address) public matches;

    function writeMapping(address addr) {
        matches[addr] = msg.sender;
    }
}
