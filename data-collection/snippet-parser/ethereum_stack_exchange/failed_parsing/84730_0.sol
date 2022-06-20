function addUser( string memory _username, string memory _nome, string memory _cognome, string memory _email) public  isOwner() {
    require(bytes(_username).length > 0 , "Username vuoto");
    require(bytes(_nome).length > 0 , "Nome vuoto");
    require(bytes(_cognome).length > 0 , "Cognome vuoto");
    require(bytes(_email).length > 0 , "Email vuota");
    
    if(checkUsernameExisting(_username)==0)
    {
        userCount ++;
        users[userCount] = User(userCount, _username, _nome, _cognome, _email);
        emit UserAdded(userCount, _username, _nome, _cognome, _email);
    }
    else
    {
        **revert("User already exists");**
    }

}
