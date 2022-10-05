uint256 random = uint256(
                    keccak256(
                        abi.encodePacked(
                            block.difficulty,
                            block.timestamp,
                            msg.sender                            
                        )
                    )
                ) % 100;
if (random >= 90) {
        
    } else {
        
    }
