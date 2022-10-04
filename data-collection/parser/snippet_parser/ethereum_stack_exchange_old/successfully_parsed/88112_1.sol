function checkEfficient32PositionGroupForZeroes(uint256 toCheck) public pure returns (uint256 amountOfZeroes) {
        assembly {
            
            if eq(and(toCheck, 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }
            
            mstore(0x1F, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }

            mstore(0x1E, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }
            
            mstore(0x1D, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }

            mstore(0x1C, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }
            
            mstore(0x1B, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }

            mstore(0x1A, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }
            
            mstore(0x19, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }

            mstore(0x18, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }
            
            mstore(0x17, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }

            mstore(0x16, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }
            
            mstore(0x15, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }

            mstore(0x14, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }
            
            mstore(0x13, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }

            mstore(0x12, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }
            
            mstore(0x11, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }

            mstore(0x10, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }
            
            mstore(0x0F, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }

            mstore(0x0E, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }
            
            mstore(0x0D, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }

            mstore(0x0C, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }
            
            mstore(0x0B, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }

            mstore(0x0A, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }
            
            mstore(0x09, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }

            mstore(0x08, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }
            
            mstore(0x07, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }

            mstore(0x06, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }
            
            mstore(0x05, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }

            mstore(0x04, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }
            
            mstore(0x03, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }

            mstore(0x02, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }
            
            mstore(0x01, toCheck)
            if eq(and(mload(0), 0x00000000000000000000000000000000000000000000000000000000000000FF), 0x00) {
                amountOfZeroes := add(amountOfZeroes, 1)
            }
        }
    }
