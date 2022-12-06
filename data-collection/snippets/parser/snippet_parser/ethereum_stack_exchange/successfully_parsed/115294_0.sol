function addUSer (string memory _name) public {
    usersCount ++;
    users[usersCount] = User(usersCount, _name);
    emit UserAdded(usersCount, _name);
}
