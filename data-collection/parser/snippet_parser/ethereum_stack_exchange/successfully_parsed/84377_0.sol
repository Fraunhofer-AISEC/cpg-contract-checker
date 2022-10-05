pragma solidity ^0.5.16;

contract DocumentHash{

    string public documentHash;
    mapping (string => string) hashAlreadyRegistered;
        
    function setDocumentHash(string memory hash) public {
        require(keccak256( abi.encodePacked((""))) != keccak256(abi.encodePacked((hash))), "Empty hash!");
        require(keccak256( abi.encodePacked((hashAlreadyRegistered[documentHash]))) != keccak256(abi.encodePacked((hash))), "Hash already registered");
        
        documentHash = hash;
        hashAlreadyRegistered[documentHash] = hash;
    }
 
    function getDocumentHash() public view returns(string memory) {
        return documentHash;
    }
}
