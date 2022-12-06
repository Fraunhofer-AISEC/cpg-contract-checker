pragma solidity ^0.4.13;




contract Incrementer {
    uint iteration;

    function Incrementer() {
        iteration = 0;
    }

    function increment(uint count) {
        iteration += count;
    }

    function getIteration() constant returns (uint) {
        return iteration;
    }

}
