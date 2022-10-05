contract SimpleStorage {

    
    uint256 public favoriteNumber;
    
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

}
