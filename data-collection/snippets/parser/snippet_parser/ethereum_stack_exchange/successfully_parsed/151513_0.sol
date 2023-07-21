function _encodeData(LoanLibrary.Predicate[] memory predicates) public view returns (bytes32 itemsHash) {
       bytes32[] memory itemHashes = new bytes32[](predicates.length);

        for(uint i = 0; i < predicates.length; ++i){
            itemHashes[i] = keccak256(
                abi.encode(
                    _PREDICATE_TYPEHASH,
                    predicates[i].data,
                    predicates[i].verifier
                )
            );
        }

        
        itemsHash = keccak256(abi.encodePacked(itemHashes));

        return itemsHash;
    }
