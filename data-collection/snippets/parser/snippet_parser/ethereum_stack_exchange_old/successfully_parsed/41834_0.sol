 struct User {
        string fullName; 
        bool isVerified; 
 }

mapping(address => User) public users;

function f() {
users[msg.sender].fullName = "John Smith";
users[msg.sender].isVerified = true;
}
