pragma solidity ^0.4.24;

contract MyContract {

  struct Person {
    uint age;
    uint size;
  }

  
  Person[] persons;


  
  uint256[] personIds;

  
  mapping (uint256 => uint256) personIdToIndex;

  modifier personExists(uint256 _id) {
    uint256 index = personIdToIndex[_id]; 
    require(personIds[index] == _id, "Person does not exist.");

    _;
  }

  event PersonAdded(uint indexed id, uint age, uint size);

  function addPerson(uint _age, uint _size) public {
    Person memory person = Person(_age, _size);
    id = persons.push(person) - 1;

    uint256 key = personIds.push(id) - 1;
    personIdToIndex[id] = key;

    emit PersonAdded(id, _age, _size)
  }

  function removePerson(uint _id) personExists(_id) public {
    delete persons[_id]

    
    uint256 key = personIdToIndex[_id];

    
    personIds[key] = personIds[personIds.length - 1];

    
    personIdToIndex[personIds[key]] = key;

    
    personIds.length--;
  }
}
