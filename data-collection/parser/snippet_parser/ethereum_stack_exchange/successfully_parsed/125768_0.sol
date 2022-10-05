
pragma solidity ^0.6.0;

contract SimpleStograge {
    unit256 favoriteNumber;

    function store(unit256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
}
