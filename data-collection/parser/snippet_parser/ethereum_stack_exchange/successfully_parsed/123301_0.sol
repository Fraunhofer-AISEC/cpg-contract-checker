contract MexicoCity {
    uint256  public favoriteNumber;

   
    function store(uint256 _10time) public  {
        favoriteNumber = _10time;
    }
    
    people [] public folks;
    
    
    

    function getback () public view returns (uint256) {
        return favoriteNumber;
    }


}
