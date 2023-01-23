    function addPerson (string memory _name, uint256 _favNum) public {
        People memory newPerson = People({name: _name, favNum: _favNum});
        people.push(newPerson);
        nameToFavNum[_name] = _favNum;
    }
