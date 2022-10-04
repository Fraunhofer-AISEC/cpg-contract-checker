pragma solidity ^0.4.24;

contract Count {
    uint256 private storedData;

    function set(uint256 index, uint256 value) public {
        storedData[index] = value;
    }

    function push(uint256 value) public {
        storedData.push(value);
    }

    function get(uint256 index) public view returns(uint256) {
        return storedData[key]; 
    }
}
