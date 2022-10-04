pragma solidity ^0.4.8;

library LibUserData{

    struct data{
        string firstName;
        string lastName;
    }

    function setName(data storage _data, string _firstName, string _lastName){
        _data.firstName = _firstName;
        _data.lastName = _lastName;
    }
}

contract User{

    mapping (address => LibUserData.data) public userData;

    function setName(address _address, string _firstName, string _lastName){
        LibUserData.setName(userData[_address], _firstName, _lastName);
    }

    function getName(address _address) constant returns (string, string) {
        return (userData[_address].firstName, userData[_address].firstName);
    }
}
