File: dummycontract.sol

pragma solidity ^0.4.17;

contract DummyContract {

    uint[] public elements;

    function addElement(uint element) public {
        elements.push(element);
    }

    function getNumberOfElements() public view returns(uint) {
        uint numElements = uint(elements.length);
        return numElements;
    }

}
