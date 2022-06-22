function setUserMethod1(string memory _name , string memory _surname , uint _age) public returns(uint userID){
    userID = total_users++;
    User memory new_user;
    new_user.name = _name;
    new_user.surname = _surname;
    new_user.age = _age;

    users[userID] = new_user;

    emit infoChanged(_name,_surname,_age);
}
