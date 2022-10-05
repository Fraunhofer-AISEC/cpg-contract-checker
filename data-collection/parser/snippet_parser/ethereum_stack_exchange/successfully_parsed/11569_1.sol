pragma solidity ^0.4.4;

contract People {

    Person[] public people;

    struct Person {
      bytes32 firstName;
      bytes32 lastName;
      uint age;
    }

    function addPerson(bytes32 firstName, bytes32 lastName, uint age) returns (bool success) {

      Person memory newPerson;
      newPerson.firstName = firstName;
      newPerson.lastName = lastName;
      newPerson.age = age;

      people.push(newPerson);
      return true;
    }

    function getPerson(uint index) constant returns(bytes32 firstName, bytes32 lastName, uint age) {
        
        return (people[index].firstName, people[index].lastName, people[index].age);
    }

    function getPersonCount() constant returns(uint count) {
        return people.length;
    }

}
