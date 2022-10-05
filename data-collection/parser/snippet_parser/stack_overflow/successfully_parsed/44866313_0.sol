pragma solidity ^0.4.11;

contract Adder {

    uint public total;

    function add(uint amount) {
        total += amount;
    }

    function getTotal() returns(uint){
        return total;
    }
}
