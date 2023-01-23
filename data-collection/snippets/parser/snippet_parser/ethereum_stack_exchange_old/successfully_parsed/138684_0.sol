 function maxOf(uint256[] memory a) public pure returns (uint256 max) {
        assembly {
            
            
            let len := mload(a)

            
            let element := add(a, 0x20)

            
            max := mload(element)
            for { let end := add(element, mul(len, 0x20)) } 
            lt(element, end) { element := add(element, 0x20) } {
                
                
                let ele := mload(element)
                max := xor(max, and(xor(max, ele), mul(0xFFFFFFFFFFFFFFFFFFF, lt(max, ele))))
            }
        }
    }
