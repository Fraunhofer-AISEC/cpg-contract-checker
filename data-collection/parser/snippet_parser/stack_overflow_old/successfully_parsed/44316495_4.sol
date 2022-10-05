
pragma solidity ^0.8.3;

contract Test {
    address public owner;

    event ContractCreated();

    constructor() {
        owner = msg.sender;

        emit ContractCreated();
    }
}
