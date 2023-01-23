contract SimpleStorage {

    
    uint256 public favoriteNumber;
    
    functon store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

}
