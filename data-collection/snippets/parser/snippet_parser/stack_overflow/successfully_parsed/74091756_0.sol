
pragma solidity 0.8.8;

contract SimpleStorage {
    
    bool HasFavoriteNumber = true;
    uint256 public FavoriteNumber;

    function store(uint256 _FavoriteNumber) public {
        FavoriteNumber = _FavoriteNumber;
        uint256 testVar = 5;
    }
    
    function retrieve() public view returns(uint256){
        return FavoriteNumber;
    }
}
