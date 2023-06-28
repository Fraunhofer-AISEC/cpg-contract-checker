pragma solidity 0.5.0;

contract UserManager {
   struct User {
      string username;
      string password;
      address userid;
      bool isAdmin;
   }

   mapping (uint => User) users;
   uint totalUsers=0;

   function checkIfUserExists(address userid) public view returns(bool) {
       for (uint o = 0; o < totalUsers; o++) {
           if (users[o].userid == userid) {
               return true;
           } else{
               return false;
           }
       }
   }

   function addUser(address userid) public {
       User memory user = User("m", "n", userid, true);
       totalUsers++;
       users[totalUsers] = user;

   }

}
