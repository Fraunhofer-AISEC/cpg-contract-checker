

pragma solidity ^0.8.1;

contract Users{

struct User{
    
    string name;
    bool enabled;
    bool isAdmin;
    bool exist;
    
}

User[] public usersList;
mapping(address => User) public addressToUser;

function isEnabled(address _adress) public view returns(bool){
    return addressToUser[_adress].enabled;
}

function getName(address _adress) public view returns(string memory){
    return addressToUser[_adress].name;
}

function getUser(address _adress) public view returns(User memory){
    
    return addressToUser[_adress];
    
}

function addNewUser(string calldata _name) public{
    
    require(bytes(_name).length > 0, "User's name can't be empty");
    require(addressToUser[msg.sender].exist == false, "Address is already bind to an existing user");

    User memory newUser = User(_name, false, false, true);
    
    usersList.push( newUser );
    addressToUser[msg.sender] = newUser;

}

function setEnabled(address _adress) public{
    
    require(addressToUser[msg.sender].exist == true, "Address is not bind to any existing user");
    
    User storage user = addressToUser[_adress];
    user.enabled = true;
    
}

}
