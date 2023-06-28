pragma solidity ^0.8.7;

contract Guests {
    struct Person {
        string name;
        uint favNo;
    }
    Person[] public people;

    constructor() {
        people.push(Person("John", 56));
        people.push(Person("Emilia", 1337));
    }

    function getPeople(uint _index) public view returns (string memory, uint) {
        require (_index < people.length, "person does not exist.");
        return (people[_index].name, people[_index].favNo);
    }

    function addPerson(string memory _name, uint _favNo) public {
        people.push(Person(_name, _favNo));
    }
}
