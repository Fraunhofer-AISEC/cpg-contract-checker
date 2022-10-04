pragma solidity ^0.5.7;
contract store {
    bytes32 data;
    function set(string memory _word) public {
        data = keccak256(abi.encodePacked(_word));
    }
}
