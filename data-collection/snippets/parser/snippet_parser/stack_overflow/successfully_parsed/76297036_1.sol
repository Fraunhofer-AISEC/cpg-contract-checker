pragma solidity ^0.8;

contract MyContract {
    function foo() external pure returns (uint8) {
        uint16 larger = 512;           
        uint8 smaller = uint8(larger); 
        return smaller;
    }
}
