pragma solidity <0.8.0;



contract Adder {
    uint public counter;

    constructor(uint init) {
        counter = init;
    }

    function addOne() public returns (uint) {
        counter++;
        return counter;
    }

    function theCounter() public view returns (uint) {
        return counter;
    }


}
