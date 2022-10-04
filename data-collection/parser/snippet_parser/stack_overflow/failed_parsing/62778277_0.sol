uint256 constant NUM_OF_GROUPS = 129600; 

....... 

function decodeAndCheckGroupIndexes(uint256 x)
        public
        pure
        returns (
            uint24 a,
            uint24 b,
            uint24 c,
            uint24 d,
            uint24 e,
            uint24 f,
            uint24 g,
            uint24 h,
            uint24 i,
            uint24 j
        )
    {
        assembly {
            j := x
            mstore(0x1B, x)
            a := mload(0)
            mstore(0x18, x)
            b := mload(0)
            mstore(0x15, x)
            c := mload(0)
            mstore(0x12, x)
            d := mload(0)
            mstore(0x0F, x)
            e := mload(0)
            mstore(0x0C, x)
            f := mload(0)
            mstore(0x09, x)
            g := mload(0)
            mstore(0x06, x)
            h := mload(0)
            mstore(0x03, x)
            i := mload(0)
        }
        require(
            a < NUM_OF_GROUPS &&
                b < NUM_OF_GROUPS &&
                c < NUM_OF_GROUPS &&
                d < NUM_OF_GROUPS &&
                e < NUM_OF_GROUPS &&
                f < NUM_OF_GROUPS &&
                g < NUM_OF_GROUPS &&
                h < NUM_OF_GROUPS &&
                i < NUM_OF_GROUPS &&
                j < NUM_OF_GROUPS,
            "group is out of range"
        ); 
    }
