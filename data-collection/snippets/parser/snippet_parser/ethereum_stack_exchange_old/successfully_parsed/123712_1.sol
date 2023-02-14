function register(address newUser) public {
    users[newUser] = true;
    emit Register(newUser);
}
