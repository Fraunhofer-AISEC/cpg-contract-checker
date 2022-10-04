pragma solidity ^0.4.6;

contract Hub {

  
  mapping(address => uint) personMap;
  address[] public personIndex;

  address public owner;

  function Hub() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    if(msg.sender != owner) throw;
    _;
  }

  function createPerson() 
    public
    returns(address newPerson)
  {
    Person p = new Person(msg.sender);              
    personMap[p] = personIndex.length;              
    personIndex.push(p);                            
    return p;
  }

  function deletePerson(address person) 
    onlyOwner
    returns(bool success)
  {
    
    uint location = personMap[person];              
    address personAddress = personIndex[location];  
    
    if(personIndex[personMap[person]] != person) throw; 
    
    personIndex[personMap[person]] = personIndex[personIndex.length-1];
    
    
    personMap[personIndex[personIndex.length-1]] = personMap[person]; 
    
    personIndex.length--;
    
    return true;
  }

  

  function getPersonCount() 
    public
    constant
    returns(uint count)
  {
    return personIndex.length;
  }

  function getPersonAtIndex(uint index)
    public
    constant
    returns(address person)
  {
    return personIndex[index];
  }
}

contract Person {

  
  address public personOwner;

  struct PersonStruct {
    bytes32 encrypted1;
    bytes32 encrypted2;
  }

  PersonStruct p;

  modifier onlyPerson {                       
    if(msg.sender != personOwner) throw;
    _;
  }

  function Person(address person) {
    personOwner = person;                   
    
  }

  function getPerson()
    onlyPerson
    constant
    returns(bytes32, bytes32)
  {
    return(p.encrypted1, p.encrypted2);
  }

  function setPerson(bytes32 part1, bytes32 part2)
    onlyPerson
    returns(bool success)
  {
    p.encrypted1 = part1;
    p.encrypted2 = part2;
    return true;
  }
}
