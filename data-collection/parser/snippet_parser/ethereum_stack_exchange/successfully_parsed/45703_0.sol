pragma solidity ^0.4.21;

library UserLib {
  function insertUser(address dbAddr, bytes32 user) public {
      DB(dbAddr).setUser(user);
  }
}

contract DB {
  mapping(bytes32 => bool) private user;

  function setUser(bytes32 usr) public {
      user[usr] = true;
  }

  function isUser(bytes32 usr) public view returns (bool) {
     return user[usr];
  }
}

contract Parent {
   using UserLib for *;

   function insertUser(address db, bytes32 usr) public {
      UserLib.insertUser(db, usr);
   }
}
