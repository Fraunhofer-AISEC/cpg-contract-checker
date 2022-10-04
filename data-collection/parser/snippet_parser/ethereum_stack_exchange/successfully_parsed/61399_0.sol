pragma solidity 0.4.25;

contract Subtract {

    function subtract(uint a, uint b) public pure returns(uint remainder) {
        if(b>a) return 0;
        return b-a;
    }
}
