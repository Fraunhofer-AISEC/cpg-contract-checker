pragma solidity ^0.4.17;

contract Test {
    bytes16 number;

    function getNumber() public view returns(bytes16) {
        return number;
    }

    function setNumber(bytes16 _number) public {
        number = _number;
    }
}
