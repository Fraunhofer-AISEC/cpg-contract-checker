struct Proof {
    uint tokenID; 
    bytes32[] _merkleProof;
    }

function mint(Proof[] memory proofs) public {   
 for (uint i; i< proofs.length;i++){

    bytes32 leafs = keccak256(abi.encodePacked(proofs[i].tokenID));
    
    require(MerkleProof.verify(proofs[i]._merkleProof, merkleRoot, leafs), "Invalid Merkle Proof.");
    }
}
