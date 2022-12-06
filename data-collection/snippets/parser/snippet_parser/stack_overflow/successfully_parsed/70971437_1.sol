
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/ownership/Ownable.sol";

contract SocialNetwork is Ownable {
  struct Post {
    string content;
    address author;
  }
    
  struct User {
    uint registerDate;
    bytes32 username;
    bytes32 password;
    bytes32 email;
  }

  User[] users;

  uint256 userId;
  mapping(uint256 => User) usersId;
      
  bool usernameAvaiable;
  bool emailAvaiable;

  function checkRegisterability(bytes32 _username, bytes32 _password, bytes32 _email) internal view onlyOwner returns(bool registerability) {
    for(uint i; i <= users.length; i++) {
        if(usersId[i].username != _username) {
            usernameAvaiable;
        } else {usernameAvaiable = false;}
        if(usersId[i].email != _email) {
            emailAvaiable;
        } else {emailAvaiable = false;}
    }
    require(usernameAvaiable == false, "This username is unavaiable");
    require(emailAvaiable == false, "This email is unavaiable");
    require(usernameAvaiable && emailAvaiable);
    registerability;
    return registerability;
  }
}
