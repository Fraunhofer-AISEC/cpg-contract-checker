pragma solidity ^0.4.24;

import "./ContractAuth .sol";



contract TestContractAuth is ContractAuth {

    
    function getPrefixedHashTest(bytes32 messageHash) public pure returns (bytes32) {
        return getPrefixedHash(messageHash);
    }

    
    function verifyMessageHashTest(bytes32 messageHash, uint8 v, bytes32 r, bytes32 s) public view returns (bool) {
        return verifyMessageHash(messageHash, v, r, s);
    }

    function verifyMultipleInputs(uint256 inputNumber, address inputAddress, uint8 v, bytes32 r, bytes32 s) public view returns (bool) {
        bytes32 messageHash = keccak256(abi.encodePacked(inputNumber, inputAddress));
        return verifyMessageHash(messageHash, v, r, s);
    }
}
