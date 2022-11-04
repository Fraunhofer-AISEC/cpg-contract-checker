struct User {
    string username;
    string password;
    address userid;
    bool isAdmin;
}

mapping (uint => User) users;

function checkIfUserExists(address _userid) public returns(bool) {

    for (uint index = 0; index < totalNumberOfUsers; index++) {
        if (users[index].userid == _userid) {
            return true;
        }
    }
    return false;
}
