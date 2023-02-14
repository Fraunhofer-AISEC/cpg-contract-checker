pragma solidity ^0.5

contract ProofOfExistence {

    

    function proofFor(string memory document) public view returns(bytes32) {
        return sha256(document);
    }

    
}
