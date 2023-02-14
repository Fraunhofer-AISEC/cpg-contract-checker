pragma solidity ^0.4.11;

contract A{
    uint a =10;
    address owner;
    function A(){
        owner = msg.sender;
    }

    function updateValue(uint a) {
        require(msg.sender == owner);
        a = a+10;
    }
}
