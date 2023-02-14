contract Spiral {
    struct Chunk {
        int256 x;
        int256 y;
    }
    Chunk[] public chunks;
    bytes1 directionB = 0x00;
    function addChunk() public {
        uint256 r;
        int256 x;
        int256 y;
        assembly {
            r := sload(0)
            x := sload(keccak256(sub(r, 1), 0x20))
            y := sload(add(keccak256(sub(r, 1), 0x20), 1))
        }
        
        assembly {
            sstore(chunks.slot, add(sload(chunks.slot), 1))

            switch sload(directionB.slot)
            case 0x00 {
                sstore(keccak256(r, 0x20), add(x, 1))
                sstore(add(keccak256(r, 0x20), 1), y)
            }
            case 0x01 {
                sstore(keccak256(r, 0x20), x)
                sstore(add(keccak256(r, 0x20), 1), sub(y, 1))
            }
            case 0x02 {
                sstore(keccak256(r, 0x20), sub(x, 1))
                sstore(add(keccak256(r, 0x20), 1), y)
            }
            case 0x03 {
                sstore(keccak256(r, 0x20), x)
                sstore(add(keccak256(r, 0x20), 1), add(y, 1))
            }
        }
    }
}
