struct ProofData {
    address user;
    address otherUsers;
}

bytes32 constant TYPE_HASH_EASY = keccak256("ProofData(address user, address otherUsers)"); 
