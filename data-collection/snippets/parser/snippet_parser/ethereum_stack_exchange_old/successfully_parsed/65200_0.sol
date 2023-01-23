pragma solidity ^0.4.16;

contract init {
    address owner;
    address[] public userAddresses;
    function init() {
        owner = msg.sender;
    }

    function getaddresses(address rec) public {
        userAddresses.push(rec);
    } 

    function seneth(uint value) public {
        for (uint i = 0; i < userAddresses.length; i++) {
            userAddresses[i].transfer(value);
        }
    }
}
