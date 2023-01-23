contract Structs {

    struct User {
        string name;
        uint256 score;
        uint256 balance;
    }

    mapping(address => User) userList;
    
    function addUser() public {
        User memory user1 = User({name: "Jimmy", score: 1, balance: 100});
        userList[msg.sender] = user1;
    }
}
