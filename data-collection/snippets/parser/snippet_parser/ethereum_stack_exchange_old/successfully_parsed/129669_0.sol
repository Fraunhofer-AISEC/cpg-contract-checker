
pragma solidity ^0.6.0;

contract SimpleStorage {
    
    uint256 favoriveNumber;
    bool  favoriteBool;

    struct people  {
        uint256 favoriveNumber;
        string  name;
    }
    people public _person;

    function store(uint256 _favoriteNumber) public {
       _favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256) { 
       return favoriveNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public{
    favorivepeople.push(people(_favoriteNumber, _name));
    }
}
