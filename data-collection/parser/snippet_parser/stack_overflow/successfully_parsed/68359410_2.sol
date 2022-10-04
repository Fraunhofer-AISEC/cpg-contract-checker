pragma solidity ^0.8;

contract MyContract {
    uint256[] public myArray;
    
    function addToArray(uint256 _value) external {
        myArray.push(_value);
    }
    
    function myArrayLength() external view returns (uint256) {
        return myArray.length;
    }
}
