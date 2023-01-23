
uint256 public favoriteNumber;
bool favoriteBool;

struct people{
    uint256 favoriteNumber;
    string name;
}

People[] public people;
mapping(string => uint256) public nameToFavoriteNumber;

function store(uint256 _favoriteNumber) public {
    favoriteNumber = _favoriteNumber;

}


function retrieve() public view returns(uint256) {
    return favoriteNumber;
}

function addPerson(string memory _name, uint256 _favoriteNumber) public{
    people.push(people(_favoriteNumber, _name));
    nameToFavoriteNumber[_name] = _favoriteNumber;
}
