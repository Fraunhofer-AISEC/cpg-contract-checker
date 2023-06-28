pragma solidity ^0.4.7;

contract owned {
    address owner;
    function owned() {
        owner = msg.sender;
    }
    function getOwner() constant returns(address) {
        return owner;
    }
}

contract simple is owned {
    function twice(int a) constant returns(int) {
        return 2*a;
    }
}
