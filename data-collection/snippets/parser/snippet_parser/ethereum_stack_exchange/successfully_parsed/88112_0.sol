function check32PositionGroupForZeroes(uint256 toCheck) public pure returns (uint256 amountOfZeroes) {
        assembly {
            let converted := and(toCheck, 0x00000000000000000000000000000000000000000000000000000000000000FF) 
            if eq(converted, 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }
            let len := 0x1F 
            let offset := 0x1F
            
            for { let i := 0 } lt(i, len) { i := add(i, 1) } {
                mstore(offset, toCheck)
                converted := and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF)
                
                if eq(converted, 0x00) {
                    amountOfZeroes := add(amountOfZeroes, 1)
                }
                offset := sub(offset, 0x01)
            }
        }
    }
