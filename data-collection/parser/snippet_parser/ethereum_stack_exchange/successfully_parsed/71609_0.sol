struct User {
       string username;
       string password;
       address userid;
        bool isAdmin;
}

mapping (uint => User) users;

function checkIfUserExists(address userid) public returns(bool) {
    for (uint o = 0; o < totalUsers; o++) {
        if (users[o].userid == userid) {
            return true;
        } else{
            return false;
        }
}
}