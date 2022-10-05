pragma solidity ^0.4.25;

contract ZK {
    uint private age;

    constructor (uint _age) public {
        age = _age;
    }

    function isAdult() public view returns (bool) {
        return (age >= 18);
    }

    function isTeen() public view returns (bool) {
        return (age >= 13 && age <= 19);
    }

    function addYears (uint _years) public {
        age += _years;
    }
}
