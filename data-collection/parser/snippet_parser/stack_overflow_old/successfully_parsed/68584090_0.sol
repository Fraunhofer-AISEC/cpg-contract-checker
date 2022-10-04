pragma solidity ^0.8.0;

contract Project {

    struct Person {
        string name;
        string description;
    }
    
    Person[] public people;

    function getPersonCount() public view returns (uint) {
        return people.length;
    }

}

