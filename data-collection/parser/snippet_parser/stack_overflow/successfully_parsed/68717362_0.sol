pragma solidity ^0.8;

contract MyContract {
    
    bytes32 hash = 0x41b1a0649752af1b28b3dc29a1556eee781e4a4c3a1f7f53f90fa834de098c4d;
    
    function guessThePassword(string memory _password) external view returns (bool) {
        return keccak256(abi.encodePacked(_password)) == hash;
    }
}
