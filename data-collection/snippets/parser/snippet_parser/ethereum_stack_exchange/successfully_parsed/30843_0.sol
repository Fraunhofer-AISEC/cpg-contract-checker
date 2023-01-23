pragma solidity ^0.4.17;

contract Thingy {
    uint[] public thing = [1];


    function addToArray() public {
        thing.push(1);
    }
}
