pragma solidity ^0.4.17;

contract Users {
    struct User {
        string firstName;
        string lastName;
    }
    mapping(address => User) public users;

    function getFirstName() public view returns (string) {
        User memory user = users[msg.sender];
        return user.firstName;
    }

    function setFirstName(newName) public {
        User memory user = users[msg.sender];
        user.firstName = newName;
    }
}
