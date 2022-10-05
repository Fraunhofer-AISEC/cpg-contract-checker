function exp_2(int128 x) internal pure returns (int128) {
    unchecked {
        require(x < 0x400000000000000000); 

        if (x < -0x400000000000000000) return 0; 

        uint256 result = 0x80000000000000000000000000000000;

        

        result >>= uint256(int256(63 - (x >> 64)));
        require(result <= uint256(int256(MAX_64x64)));

        return int128(int256(result));
    }
}
