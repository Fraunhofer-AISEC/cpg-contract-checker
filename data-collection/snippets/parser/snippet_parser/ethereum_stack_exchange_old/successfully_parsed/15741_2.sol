 pragma solidity ^0.4.4;

contract Users {
    mapping (bytes32 => address) public users;

    function register(bytes32 name) {
        if(users[name] == 0x0 && name != ""){
            users[name] = msg.sender;

        }
    }

    function checkAvailability(bytes32 name) returns (bool) {
      if(users[name] == 0x0) {
        return true;
      }
      return false;
    }

}
