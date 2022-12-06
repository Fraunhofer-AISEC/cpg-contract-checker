pragma solidity ^0.4.4;

contract Hello {
    bytes32 x;
    function getBytes() returns(bytes32){
        return x;
    }
    function setBytes(bytes32 b)  {
        x = b;
    }

}
