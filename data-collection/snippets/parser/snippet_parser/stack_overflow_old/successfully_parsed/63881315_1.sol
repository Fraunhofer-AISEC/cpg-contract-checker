pragma solidity ^0.4.19;

contract SampleContract{
    
    
    struct User{
      string name;
      uint age;
    }

   User[] public users;
   
   

   constructor(uint _arrayLength) public{
      users.length = _arrayLength;
   }

   function addUsers(string _name, uint _age) public {
    
        users.push(User(_name,_age))-1;
   }

   function getUser(uint i) public view returns (string, uint) {
       return (users[i].name, users[i].age);
   }
}
