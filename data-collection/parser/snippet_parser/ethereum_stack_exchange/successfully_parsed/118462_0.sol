pragma solidity ^0.6.0

contract SimpleStorage{

    
    uint256 favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }
    People public person = People({favoriteNumber: 2, name: "Yannick"});

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve()public view returns(uint256) {
        return favoriteNumber;
    }
}
