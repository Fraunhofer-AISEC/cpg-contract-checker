
pragma solidity 0.8.16;

type UserId is uint256;

contract Contract {

    mapping(UserId => User) public users;

    struct User {
        UserId id;
        string name;
    }

    function getUser(UserId userId) public view returns(User memory) {
        return users[userId];
    }

}
