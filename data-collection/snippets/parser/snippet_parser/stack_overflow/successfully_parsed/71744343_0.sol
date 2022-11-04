pragma solidity >=0.6.0 <0.9.0;

contract SimpleStorage {

    
    uint256 favoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;

        
    }
}
