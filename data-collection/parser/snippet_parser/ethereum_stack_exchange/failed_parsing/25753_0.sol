bytes32 bHash = keccak256(block.coinbase, block.number, block.timestamp);

            if (bHash[30] == 0xFF && bHash[31] >= 0xF4) {
                
                
            } else if (bHash[28] == 0xFF && bHash[29] >= 0xD5) {
                
                
            } else if (bHash[26] == 0xFF && bHash[27] >= 0x7E) {
                
                
            } else if (bHash[25] >= 0xF4) {
                
                
            }
