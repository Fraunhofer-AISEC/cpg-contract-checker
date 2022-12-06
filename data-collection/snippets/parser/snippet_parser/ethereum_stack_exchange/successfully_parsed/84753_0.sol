pragma solidity ^0.5.0;

contract Profile {

    struct User {
       string name;
       string subtitle;
       string sdescription;
       string ldescription;
       string weburl;
       string memehash;
    }

    mapping(address => User) public users; 

  function set(string memory _name, string memory _subtitle, string memory _sdescription,string memory _ldescription, string memory _weburl, string memory _memehash) public {
    users[msg.sender] = User(_name, _subtitle, _sdescription, _ldescription, _weburl, _memehash);
  }

  function get() public view returns (string memory) {
    return users[msg.sender].name;
    return users[msg.sender].subtitle;
    return users[msg.sender].sdescription;
    return users[msg.sender].ldescription;
    return users[msg.sender].weburl;
    return users[msg.sender].memehash;
  }
}
