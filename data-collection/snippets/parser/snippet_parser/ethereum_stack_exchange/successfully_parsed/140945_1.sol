    function sortFixedArrayAssembly(uint256[6] memory array) public pure returns (uint256[6] memory sortedArray) {
        sortedArray = array; 
        assembly {
            let last := mload(add(sortedArray, mul(0x20, 5)))
            let highIndex := 0
            let ceiling := 0

            for { let i := 0 } lt(i, 6) { i := add(i, 1) } {
                let i_elem := mload(add(sortedArray, mul(0x20, i)))
                if and(gt(i_elem, 1), gt(i_elem, ceiling)) {
                    ceiling := i_elem
                    highIndex := i
                }
            }

            mstore(add(sortedArray, mul(0x20, 5)), ceiling)
            if lt(highIndex, 5) {
                mstore(add(sortedArray, mul(0x20, highIndex)), last)
            }
        }
        return sortedArray;
    }
