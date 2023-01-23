pragma solidity ^0.4.0;

contract Bookkeeping {

uint counter;

function Bookkeeping() {
    counter = 0;
}

function notify(uint count) returns(uint) {
    counter = count+5;
    return counter;
}

function getCurrentCounter() constant returns(uint) {
    return counter;
}


}
