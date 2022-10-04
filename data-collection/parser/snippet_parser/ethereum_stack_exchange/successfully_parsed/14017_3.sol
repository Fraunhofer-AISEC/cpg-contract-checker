pragma solidity ^0.4.6;

contract NullifyArray {

    address[] public status;

    function pushArray(address data)
        public
        returns(uint arrayLength)
    {
        return status.push(data);
    }

    function getArrayLength() 
        public 
        constant
        returns (uint arrayLength)
    {
        return status.length;
    }

    function nullifyArray()
        public
        returns(uint arrayLength)
    {
        status.length=0;
        return status.length;
    }

}
