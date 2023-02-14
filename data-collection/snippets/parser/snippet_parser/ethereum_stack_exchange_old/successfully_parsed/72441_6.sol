function setUserMethod2(string memory _name , string memory _surname , uint _age) public returns(uint userID) {
    userID = total_users++;
    users[userID] = User({
        name: _name,
        surname: _surname,
        age: _age
    });
    emit infoChanged(_name,_surname,_age);
}
