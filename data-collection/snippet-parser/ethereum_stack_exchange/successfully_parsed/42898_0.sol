pragma solidity ^0.4.20;

contract Refunds {

    mapping(uint => bool) public data;

    function setIt() public {
        data[1] = true;
    }

    function deleteIt() public {  
        delete data[1];
    }
} 
