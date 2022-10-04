pragma solidity ^0.4.0;

contract Feline {
    function utterance() returns (bytes32);
}

contract Cat is Feline {
    function utterance() returns (bytes32) { return "miaow"; }
}
