pragma solidity ^0.6.0;

contract SimpleStorage {

    
    
    
     uint256 favoriteNumber;
     bool  favoriteBool;
     
     struct people {
       uint256 favoriteNumber;
        string name;
     }

    people[] public people;
    
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
        
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public{ 
        people.push(people({favoriteNumber: _favoriteNumber, name: _name}), 

