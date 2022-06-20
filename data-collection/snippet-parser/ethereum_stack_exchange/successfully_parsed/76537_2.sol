mapping (uint256 => User) private users;
uint256 private numOfUsers;

function createUser(uint256 _id) onlyOwner external {
    require(users[_id] == User(0), "User already exists");
    users[_id] = new User(_id);
    emit UserCreated(users[_id], ++numOfUsers);
}
