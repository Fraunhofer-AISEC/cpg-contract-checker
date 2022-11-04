pragma solidity ^0.8.10;

contract Thing {
    address public owner;
    uint argument;

    modifier restricted() {
        require(msg.sender == owner);
        _;
    }

    constructor (uint _argument) {
        owner = msg.sender;
        argument = _argument;
    }

    function doThing() public restricted {}
}
