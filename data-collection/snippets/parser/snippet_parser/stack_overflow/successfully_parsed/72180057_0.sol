struct People {
    uint256 favoriteNumber;
    string name;
}

mapping(string => uint256) public nameToFavoriteNumber;
People[] public people;

function addPerson(uint _personFavoriteNumber, string memory _personName ) public {
    people.push(People({favoriteNumber: _personFavoriteNumber, name: _personName}));
    nameToFavoriteNumber[_personName] = _personFavoriteNumber;
}
