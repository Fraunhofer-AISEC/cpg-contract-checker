pragma solidity ^0.8;

contract PointA {
    uint256 number = 10;
    
    function retrieve() public view returns (uint256) {
        return number;
    }
}
