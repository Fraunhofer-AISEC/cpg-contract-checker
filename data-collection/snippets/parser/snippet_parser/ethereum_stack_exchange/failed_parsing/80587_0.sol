pragma solidity ^0.6.*; 
contract MyContract{
    
  Person[] public people;
  uint256 public peopleCount;
    struct Person{
        string _firstname;
        string _lastname;
    }

    function addPerson(string memory _firstname,string memory _lastname) public{
        people.push(Person(_firstname,_lastname));
        peopleCount +=1;
    } 
}
