pragma solidity ^0.8.13;

contract APIUsers {
    event CreatedUser();
    
    
    mapping(string => string) public users;

    function createUser(string memory _userid, string memory _payload) external {
        users[_userid] = _payload;
    }

    
    function getUser(string memory _userid) public view returns (string memory payload) {
        return users[_userid];
    }
}

