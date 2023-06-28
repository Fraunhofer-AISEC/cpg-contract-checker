struct User {
        bool logged;
        uint8 coins;
        address userAddress;
    }

User[] public users;

function registration(address _user) public {
     require(!users[msg.sender].logged, "User already logged");
     users.push(User(true, 10, _user));
}
