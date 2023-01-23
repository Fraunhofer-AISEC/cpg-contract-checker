pragma solidity ^0.4.19;

contract SampleContract{
    struct User{
      string name;
      uint age;
    }

   User[] users;
   uint i=0;

   constructor(uint _arrayLength)public{
      users.length = _arrayLength;
   }

   function addUsers(string _name, uint _age) public {
    uint i = 0;
    for(i = 0; i < users.length; i++) {
        users.push(_name);
        users.push(_age);
    }
   }

   function getUser() public view returns (User[]) {
       return users;
   }
}
