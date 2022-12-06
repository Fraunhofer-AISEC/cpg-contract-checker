

import './contractA.sol' ;

pragma solidity ^0.8.0;

contract contractB {

address addressA;

function setPointer(address _addressA) external {
    addressA = _addressA;
}

function getCount() external view returns (uint256) {
    InterfaceA b = InterfaceA(addressA);
    b.count();
}

function addToIncrement() external {
    InterfaceA b = InterfaceA(addressA);
    b.increment();
}
}
