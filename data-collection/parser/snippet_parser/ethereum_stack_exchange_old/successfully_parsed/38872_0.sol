pragma solidity ^0.4.19;

contract StackEthereumTholoz {

    function start(uint _int) public pure returns (uint) {
        return half(_int);
    }

    function half(uint _a) internal pure returns (uint) {
        uint b = _a/2;  
        return b;
    }

}
