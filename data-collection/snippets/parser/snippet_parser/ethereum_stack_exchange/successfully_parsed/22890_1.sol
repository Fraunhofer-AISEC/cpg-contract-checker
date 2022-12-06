pragma solidity ^0.4.9;

contract Test {
    address da;
    function getSender () constant returns (address){
        return msg.sender; 
    }
}
