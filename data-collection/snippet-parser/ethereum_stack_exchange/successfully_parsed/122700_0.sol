function prove(address who, uint amount, bytes32[] memory proof) 
        internal view returns (bool) {

            require(msg.sender == who);

            Proof memory _proof = Proof(who, amount);
            bytes32 leaf = keccak256(abi.encode(_proof));
            bytes32 computedHash = leaf;

            for (uint256 i = 0; i < proof.length; i++) {
                bytes32 proofElement = proof[i];

                if (computedHash <= proofElement) {
                    
                    computedHash = keccak256(abi.encodePacked(computedHash, proofElement));
                } else {
                    
                    computedHash = keccak256(abi.encodePacked(proofElement, computedHash));
                }
            }

            
            return computedHash == MERKLE_ROOT;
    }
