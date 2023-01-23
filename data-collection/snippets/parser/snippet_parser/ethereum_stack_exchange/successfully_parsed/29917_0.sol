pragma solidity ^0.4.18;

contract owned {
    function owned() { owner = msg.sender; }
    address owner;
}






contract MyToken is owned {
    function kill() {
        if (msg.sender == owner) selfdestruct(owner);
    }
}
