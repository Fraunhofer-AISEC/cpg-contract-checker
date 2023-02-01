

pragma solidity >=0.4.22 <0.9.0;

contract FavoriteNumber {
    function getFavoriteNumber() public view returns(uint) {}
    function setFavoriteNumber(uint _favoriteNumber) public {}
}

contract ExistingNoSet {

    function getA(address _t) public view returns (uint result) {
        return FavoriteNumber(_t).getFavoriteNumber();
    }
    
    function setA(address _t, uint _val) public {
        FavoriteNumber(_t).setFavoriteNumber(_val);
    }
}

