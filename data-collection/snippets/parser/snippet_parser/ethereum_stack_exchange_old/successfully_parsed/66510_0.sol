pragma solidity ^0.4.24;

contract Count {
    uint256 storeddata;

    function set(uint256 x) public {
        storeddata = x;
    }

    function get() public view returns(uint256) {
        return storeddata; 
    }
}
