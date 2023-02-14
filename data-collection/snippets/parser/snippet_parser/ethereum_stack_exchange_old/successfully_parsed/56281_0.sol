pragma solidity ^0.4.24;

contract MyContract {

  struct Person {
    uint age;
    uint size;
  }

  
  Person[] persons;

  event PersonAdded(uint indexed id, uint age, uint size);

  function addPerson(uint _age, uint _size) public {
    Person memory person = Person(_age, _size);
    id = persons.push(person) - 1;

    emit PersonAdded(id, _age, _size)
  }

  function removePerson(uint _id) public {
    
    

    delete persons[_id]
  }
}
