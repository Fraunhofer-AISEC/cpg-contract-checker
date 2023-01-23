pragma solidity 0.5.12;

contract ArrayMapping {

    uint[2**160-1] addressIndex;
    mapping(address => uint) mapped;

    function getArray(uint row) public returns (uint) { 
        return addressIndex[row];
    }

    function getMap(address a) public returns (uint) { 
        return mapped[a];
    }
}
