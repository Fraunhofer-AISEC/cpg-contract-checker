pragma solidity ^0.4.0;

contract A{
    byte[10] arr;

    function setElement(uint index, byte value) public {
        require(index >= 0 && index < arr.length); 
        arr[index] = value;
    }

    function getElement(uint index) view public returns (byte) {
        require(index >= 0 && index < arr.length); 
        return arr[index];
    }
}
