pragma solidity ^0.4.8;

contract X{

    uint amount;

    function X() {
        amount = amount + msg.value;
    }
}
