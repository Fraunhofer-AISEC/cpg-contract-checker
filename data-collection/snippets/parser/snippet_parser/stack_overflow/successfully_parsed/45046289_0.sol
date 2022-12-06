pragma solidity ^0.4.2;
contract People{


Person[] public people;

  struct Person{
    bytes32 firstName;
    bytes32 lastName;
    bytes32 email;
}

  function addPerson(bytes32 _firstName, bytes32 _lastName, bytes32 _email) returns (bool success){

    Person memory newPerson;    
    newPerson.firstName = _firstName;
    newPerson.lastName = _lastName;
    newPerson.email = _email;

    
    people.push(newPerson);  
    return true;

  }
  
  
  
  
  
  
  function getPeople() constant returns (bytes32[], bytes32[], bytes32[]) {

    uint length = people.length;

    bytes32[] memory firstNames = new bytes32[](length);
    bytes32[] memory lastNames = new bytes32[](length);
    bytes32[] memory email = new bytes32[](length);

    for (uint i = 0; i < people.length; i++) {
        Person memory currentPerson;
        currentPerson = people[i];

        firstNames[i] = currentPerson.firstName;
        lastNames[i] = currentPerson.lastName;
        email[i] = currentPerson.email;
      }
      return(firstNames,lastNames,email);
  }
}
