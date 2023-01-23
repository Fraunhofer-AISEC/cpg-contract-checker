        return favoriteNumber;
    function addPerson(string memory _name, uint256 _favoriteNumber) public { 
        people.push(people({favoriteNumber: _favoriteNumber, name:_name}));```
    }
