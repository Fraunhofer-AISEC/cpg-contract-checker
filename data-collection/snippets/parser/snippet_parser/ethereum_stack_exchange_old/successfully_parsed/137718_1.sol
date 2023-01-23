
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function getNumber() public view returns (uint256) {
        return number;
    }

    function increment() public {
        number++;
    }

    function decrement(uint256 num) public {
        number = number - num;
    }
}
