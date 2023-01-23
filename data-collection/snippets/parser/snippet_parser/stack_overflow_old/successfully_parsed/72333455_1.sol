pragma solidity 0.8.14;

contract testing {
uint iterator;

constructor () {
    iterator = 0;
}

function increaseIterator() public {
    iterator++;
}

function returnIterator() public view returns (uint) {
    return iterator;
}
}
