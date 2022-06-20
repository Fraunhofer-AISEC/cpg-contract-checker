

pragma solidity >=0.7.0 <0.9.0;

import "./MyInterface.sol";

contract RegisterPerson is MyInterface {

    mapping (uint => Person) persons;

    Person myPersons;

    constructor (Person memory _myPersons) {
        myPersons = _myPersons;
    }

    function addPerson (
        uint _personId,
        string memory _name,
        string memory _surname,
        uint _age
    ) public {

        Person storage newPerson = persons[_personId];

        newPerson.personId = _personId;
        newPerson.name = _name;
        newPerson.surname =_surname;
        newPerson.age = _age;
    }
}
