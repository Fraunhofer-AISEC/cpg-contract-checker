pragma solidity ^0.5.0;

contract HelloWorld {

uint public userCount = 0;


constructor() public{
    createUser ("Monicka", "Akilan", 30, "Chennai");
}

  struct User {
    uint id;
    string firstName;
    string lastName;
    uint age;
    string city;    
    uint tipAmount;
    address payable author;
  }
event profileTips(string firstName, string lastName, uint age, 
 string city, uint tipAmount, address payable author);

mapping(uint => User) public Users;

 function createUser(string memory _firstName, string memory _lastName, uint _age, 
 string memory  _city) public payable{
    userCount ++;
    
     Users[userCount] = User(userCount, _firstName, _lastName, _age, _city, 20, msg.sender);
    emit profileTips(_firstName, _lastName, _age,  _city, msg.value,  msg.sender);
 }
}
