   function verifyProof(string calldata _fullProof) public returns(bool r){
        bytes32 hashed = keccak256(abi.encodePacked(_fullProof));
         ....
         ...}
