pragma solidity ^0.8.0;

contract myConstruct {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract mySecondConstruct is myConstruct {
    constructor (string memory _name) myConstruct(_name) {} ;
}
