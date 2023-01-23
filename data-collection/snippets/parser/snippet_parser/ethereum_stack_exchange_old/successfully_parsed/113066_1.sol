pragma solidity ^0.7.6;

contract Receiver {
    
    uint256[] abc;
    
    function test(uint256 idx) public view returns (uint256 res) {
        return abc[idx];
    }

}
