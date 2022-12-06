pragma solidity ^0.8.0;

contract simple storage {

    uint256 favoriteNumber;
    bool favoriteBool;

    struct people
    {

        uint256 favoriteNumber;
        string name;
    }
    People[]public people{
        function store(uint256 _favoriteNumber) public {

            favoriteNumber =_favoriteNumber;
        }
    }


    
}
