pragma solidity ^0.5.0;
contract SimpleStorage {
    constructor() public{
   }
    uint storedData;
    function set(uint x) public {
        storedData = x;
    }
    function get() public view returns (uint) {
        uint a = 1;
        return storedData;
    }
}
