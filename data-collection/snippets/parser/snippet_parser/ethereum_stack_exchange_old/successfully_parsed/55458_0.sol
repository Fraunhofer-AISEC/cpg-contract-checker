pragma solidity ^0.4.24;

contract TestConstructorAssigns {

    mapping(uint8 => bytes32[5]) questions;

    constructor() public payable {
        questions[1] = ["first part of question", "second", "third", "and so ", "on"];
    }
}
