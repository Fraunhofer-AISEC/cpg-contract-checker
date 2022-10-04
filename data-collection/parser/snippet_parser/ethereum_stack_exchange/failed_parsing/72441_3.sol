struct user{
    string name;
    string surname;
    uint age;
}

event infoChanged(
    string name,
    string surname,
    uint age
);

uint newUser;
mapping(uint => user) public users; 


function updateUser(string memory name , string memory surname , uint age) public returns(uint userID){
    userID = newUser++;
    users[userID] = user(name, surname, age);

    emit infoChanged(name,surname,age);
}



