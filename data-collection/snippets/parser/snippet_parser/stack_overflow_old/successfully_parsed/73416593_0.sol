
pragma solidity ^0.8.7;
contract User {

 struct MyUser {
    address publicKey;
    string userName;
 }

 MyUser[] public users;

 function createUser(
    string memory _userName
 ) public {

    myUser memory user;

    user.publicKey = msg.sender;
    user.userName = _userName;

    users.push(user);
 }
} 
