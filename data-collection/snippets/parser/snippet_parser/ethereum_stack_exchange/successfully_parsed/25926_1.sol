pragma solidity ^0.4.16;

contract Contract {

    function returnValue() constant returns (bytes4) {
        return "abcd";
    }
}
