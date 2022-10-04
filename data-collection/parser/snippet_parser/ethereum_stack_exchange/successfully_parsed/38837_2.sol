pragma solidity ^0.4.19;

contract Example {

    uint16 a = 256;
    uint16 b = 256;

    function add() external view returns (uint32 c) {
        c = uint32(a) + uint32(b); 
    }
}
