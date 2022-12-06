pragma solidity ^0.4.2;

contract Login {
   event LoginAttempt(address sender, string challenge);

   function Login (string challenge) public {
       LoginAttempt(msg.sender, challenge);
   }

}
