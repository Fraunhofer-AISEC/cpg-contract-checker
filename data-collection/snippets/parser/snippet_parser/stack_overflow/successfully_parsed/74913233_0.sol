pragma solidity ^0.8.0;

contract MyContract {
  
  struct Message {
    address sender;
    string text;
  }

  struct User {
    address addr;
    string name;
  }

  mapping(uint => Message) public messages;
  mapping(address => User) public users;
  event NewMessage(uint messageId, address sender, string text);
  event UserActivity(address user, string name, bool joined);

  function sendMessage(string memory _text) public {
    messages[messages.length].sender = msg.sender;
    messages[messages.length].text = _text;
    emit NewMessage(messages.length, msg.sender, _text);
  }

  function addUser(string memory _name) public {
    users[msg.sender].addr = msg.sender;
    users[msg.sender].name = _name;
    emit UserActivity(msg.sender, _name, true);
  }

  function removeUser() public {
    delete users[msg.sender];
    emit UserActivity(msg.sender, '', false);
  }
}
