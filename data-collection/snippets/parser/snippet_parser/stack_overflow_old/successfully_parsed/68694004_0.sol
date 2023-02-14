pragma solidity ^0.8.4;

contract MyContract {
    struct User {
        bool exists;
        address owner;
    }

    mapping(uint256 => string) public names;
    mapping(address => User) public userList;

    constructor() public {
        names[1] = "asdddddd";
        names[2] = "asdf";
        names[3] = "lee";

        userList[msg.sender].owner = msg.sender;
        userList[msg.sender].exists = true;
    }
}
