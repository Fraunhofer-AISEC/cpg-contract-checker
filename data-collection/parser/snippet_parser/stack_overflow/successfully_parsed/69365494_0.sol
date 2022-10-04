pragma solidity ^0.6.0;
contract SimpleStorage {
    
    

    uint256 public favoritNumber;
    
    function store(uint256 _favoritNumber) public {
            favoritNumber = _favoritNumber;
    }
 
 function retrieve() public view returns(unit256) {
     return favoritNumber;
 }   
}
