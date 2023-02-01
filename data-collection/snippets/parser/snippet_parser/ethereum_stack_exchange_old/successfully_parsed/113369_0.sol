
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract SigTest {

    using ECDSA for bytes32;

    address private systemAddress;

    constructor (address _systemAddress) {
        systemAddress = _systemAddress;
    }

    function isValidSignature(bytes32 hash, bytes memory signature) internal view returns (bool isValid) {
        bytes32 signedHash = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
        return signedHash.recover(signature) == systemAddress;
    }

    function isDataValid(string memory mess, bytes memory signature) public view returns (bool){
        
        
        bytes32 msgHash = keccak256(abi.encodePacked(msg.sender, mess));
        require(
            isValidSignature(msgHash, signature),          
            "Invalid signature"
        );
        return true;
    }
}
