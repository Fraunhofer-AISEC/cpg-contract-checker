function _getSeedValues(uint256 _masterSeed)
        internal
        pure
        returns (
            uint32 dnaSeed,
            uint256 randomSeed,
            uint256 randomValues
        )
    {
        

        uint256 mod = 2**10 - 1;
        dnaSeed = uint32(_masterSeed % mod);
        uint256 randMod = 10**10;
        randomSeed =
             uint256(keccak256(abi.encodePacked(_masterSeed))) %
             randMod;

        uint256 valueMod = 10**20;
        randomValues =
             uint256(keccak256(abi.encodePacked(_masterSeed, DNA_LENGTH))) %
             valueMod;
        
        
        
    }
