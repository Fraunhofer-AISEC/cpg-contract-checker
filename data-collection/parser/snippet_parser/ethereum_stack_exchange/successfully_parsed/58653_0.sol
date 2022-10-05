pragma solidity ^0.4.24;

contract ContractAuth {
    function getPrefixedHash(bytes32 messageHash) internal pure returns (bytes32) {
        bytes memory hashPrefix = "\x19Ethereum Signed Message:\n32";
        return keccak256(abi.encodePacked(hashPrefix, messageHash));
    } 

    
    function verifyMessageHash(bytes32 messageHash, uint8 v, bytes32 r, bytes32 s) internal view returns (bool) {
        bytes32 prefixedHash = getPrefixedHash(messageHash);
        return ecrecover(prefixedHash, v, r, s) == msg.sender;
    }
}
