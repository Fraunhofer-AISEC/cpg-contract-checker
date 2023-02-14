
pragma solidity ^0.8.14;

contract Dog {
  string name;
  constructor(string memory _name){
       name = _name;
   }
}

contract Human {    
  Dog[] public dogs;
  uint public currDogs;

  function addDog() public {
    dogs.push(new Dog("test"));       
    currDogs++;
  }    
}
