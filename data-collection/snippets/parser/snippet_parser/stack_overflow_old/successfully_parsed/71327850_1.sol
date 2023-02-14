function getRandom(uint256 _seed) internal view returns (uint256) {
        return
            uint256(
                keccak256(
                    abi.encodePacked(
                        blockhash(block.number + 4),
                        tx.origin,
                        blockhash(block.number + 2),
                        blockhash(block.number + 3),
                        blockhash(block.number + 1),
                        _seed,
                        block.timestamp
                    )
                )
            );
    }

function getRandomType(uint256 _seed) internal pure returns (uint256) {
        

        if (uint256(uint256(keccak256(abi.encode(_seed, 5))) % 10) == 0) {
            
            return 1;
        } else {
            
            return 0;
        }
    }
