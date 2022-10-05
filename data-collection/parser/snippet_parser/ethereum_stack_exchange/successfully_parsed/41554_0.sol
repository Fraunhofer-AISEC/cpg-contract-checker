pragma solidity ^0.4.24;

contract test{
    function numFromHash(string input, uint range) public pure returns(uint) {
        return uint(keccak256(abi.encodePacked(input))) % range;
    }
}
