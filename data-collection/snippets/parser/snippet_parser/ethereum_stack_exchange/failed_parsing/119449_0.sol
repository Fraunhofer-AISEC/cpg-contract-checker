contract Structs {

    struct User {
        string name;
        uint256 score;
        uint256 balance;
    }

    mapping(address => User) userList;
    User user1 = new User({name : "Jimmy", score : 1 , balance : 100});
    userList[msg.sender] = user1;
}
