pragma solidity 0.4.24;

contract State {

    uint public c;

    function updateC(uint a, uint b) public {

        c = a + b;

    }
}
