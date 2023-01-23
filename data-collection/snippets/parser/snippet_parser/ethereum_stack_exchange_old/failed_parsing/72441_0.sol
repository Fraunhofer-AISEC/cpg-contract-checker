pragma solidity >=0.4.0 <0.7.0;

contract NewHello{

    struct kullanicilar{
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
    mapping(address => string) public users; 
    

    function updateUser(string memory name , string memory surname , unit age) public returns(uint userID){
        userID = newUser++;
        users[userID] = kullanicilar(string name, string surname, age);
        emit infoChanged(name,surname,age);
    }
    function getUser(address a) public view returns(string memory) {
        return users[a]; 
    }
}
