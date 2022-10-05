function setUserMethod3(string memory _name , string memory _surname , uint _age) public returns(uint userID) {
    userID = total_users++;
    users[userID] = User(_name, _surname, _age);
    emit infoChanged(_name,_surname,_age);
}
