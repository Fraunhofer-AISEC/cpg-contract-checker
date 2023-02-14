    function addChunk() public {
        uint256 r;
        int256 x;
        int256 y;
        assembly {
            
            r := sload(chunks.slot)
            
            
            
            mstore(0x00, chunks.slot)
            let chunks_pt := keccak256(0x00, 0x20)

            
            
            
            let p := add(mul(sub(r, 1), 2), chunks_pt)

            
            x := sload(p)
            y := sload(add(p, 1))
        }
        
        assembly {
            
            let new_r := add(r, 1)
            sstore(chunks.slot, new_r)

            switch sload(directionB.slot)
            case 0x00 {
                
                mstore(0x00, chunks.slot)
                let chunks_pt := keccak256(0x00, 0x20)
                let new_p := add(mul(r, 2), chunks_pt)

                
                sstore(new_p, add(x, 1))
                sstore(add(new_p, 1), y)
            }
            
        }
    }
