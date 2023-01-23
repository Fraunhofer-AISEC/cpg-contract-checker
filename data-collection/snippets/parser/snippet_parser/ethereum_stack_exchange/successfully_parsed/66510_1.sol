pragma solidity ^0.4.24;

contract Count {
    mapping(string => uint256) private storedData;

    function set(string key, uint256 value) public {
        storedData[key] = value;
    }

    function get(string key) public view returns(uint256) {
        return storedData[key]; 
    }
}
