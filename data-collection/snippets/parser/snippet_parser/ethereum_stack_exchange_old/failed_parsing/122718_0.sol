pragma solidity >=0.6.0 <0.9.0;

contract SimpleStorage {

    uint256 favoriteNumber;
    bool favoriteBool;

    struct People{
        uint256 favoriteNumber;
        string name;
    }
    
    People[1] public people;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
   
    function retrieve() public view returns(uint256) {
    return favoriteNumber;
    }
    
    function addPerson(string memory _name, uint256 _favoriteNumber) public
    people.push(People(_favoriteNumber, name_))
}
