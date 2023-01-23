

pragma solidity >=0.7.0 <0.9.0;

import "./MyInterface.sol";

contract GetPerson is MyInterface {
    mapping (uint => Person) persons;

    Person myPersons;

    constructor (Person memory _myPersons) {
        myPersons = _myPersons;
    }

    function askPerson(uint _personId) public view
    returns (uint personId, string memory name, string memory surname, uint age) {
        
        Person storage returnPerson = persons[_personId];

        return (returnPerson.personId, returnPerson.name, returnPerson.surname, returnPerson.age);

    }

}
