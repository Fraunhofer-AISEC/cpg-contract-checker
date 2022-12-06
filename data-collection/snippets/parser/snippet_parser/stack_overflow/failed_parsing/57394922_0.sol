event NewUser(string userid);

function createNewUser(string memory _userId) public {
    
    emit NewUser(_userId);
}
