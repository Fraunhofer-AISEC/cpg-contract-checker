
pragma solidity ^0.8.11;

contract Structs {

    struct User {
        string name;
        uint256 score;
        uint256 balance;
    }

    mapping(address => User) userList;   

    function createUser() external {    
        User memory user1 = User({name : "Liquidus", score : 1 , balance : 100});
        userList[msg.sender] = user1;
    }    
}
