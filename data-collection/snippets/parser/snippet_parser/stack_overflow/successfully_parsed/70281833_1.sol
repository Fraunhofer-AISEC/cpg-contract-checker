function batchMigration(uint256[] memory oldIds, uint256[] memory newIds, bytes32[] memory leaves, bytes32[][] memory proofs) external {
        for (uint i = 0; i < oldIds.length; i++) {
            
            require(!_exists(newIds[i]), "Token already minted");

            
            require(keccak256(abi.encodePacked(oldIds[i], newIds[i])) == leaves[i], "Ids don't match Merkle leaf");

            
            

            
            require(Opensea(openseaSharedAddress).balanceOf(msg.sender, oldIds[i]), "Only token owner can mintAndBurn");
        }

        for (uint j = 0; j < oldIds.length; j++) {
            Opensea(openseaSharedAddress).safeTransferFrom(msg.sender, burnAddress, oldIds[j], 1, "");
        }
    }
