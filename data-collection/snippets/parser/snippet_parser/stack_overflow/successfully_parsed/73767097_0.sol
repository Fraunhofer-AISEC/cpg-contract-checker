contract SimpleStorage {

    uint256 favoriteNumber;

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    } 

} 
