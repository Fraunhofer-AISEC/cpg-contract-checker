
pragma solidity ^0.8.16;

contract Contract {

    struct User {
        uint256 id;
        string name;
    }

    User[5] users;

    uint256 public userCount;

    function addUser(uint256 id, string calldata name) public {
        
        
        users[userCount++] = User(id, name);
    }

}
