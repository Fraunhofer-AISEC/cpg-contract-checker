struct User {
 string name;
}
User[] users;

function f() external {
 User memory user = users[0]; 
 user.name = "example name" 
}
