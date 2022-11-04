pragma solidity ^0.4.24;
contract example { 
    struct User {
      string name;
      uint level;
      uint[] indexcounter;
    }
    mapping (address => User) userStructs;
    address[] public userAddresses;

    function createUser(string name, uint level)public {

      
      userStructs[msg.sender].name = name;
      
      userStructs[msg.sender].level = level;
      
      userStructs[msg.sender].indexcounter.push(userAddresses.push(msg.sender)-1);
    }

    function getUserByIndex(uint index)view public returns(string,uint,uint[]){
        return(userStructs[userAddresses[index]].name,userStructs[userAddresses[index]].level,userStructs[userAddresses[index]].indexcounter);        
    }

   function getUserByAddress(address userAddress)view public returns(string,uint,uint[]){
        return(userStructs[userAddress].name,userStructs[userAddress].level,userStructs[userAddress].indexcounter);        
    }
}
