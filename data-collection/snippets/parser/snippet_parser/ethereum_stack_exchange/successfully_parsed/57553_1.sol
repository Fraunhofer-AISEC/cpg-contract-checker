pragma solidity 0.4.24;

contract Modulo {

    function getMod4(uint number) public pure returns(uint modulo) {
        return number % 4;
    }
}
