            bytes32 randomness = _currentRandomNum;

            assembly {
                
                
                
                mstore(0x00, blockhash(sub(number(), add(1, byte(0, randomness)))))
                
                
                
                
                
                mstore(0x20, xor(randomness, xor(coinbase(), difficulty())))
                
                randomness := keccak256(0x00, 0x40)
            }
            _mintRandomness = bytes9(randomness);
