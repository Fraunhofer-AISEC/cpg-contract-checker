        nominator = ABDKMath64x64.log_2(nominator);
        int128 newNominator = nominator * rebaseAmount;
        int128 result = ABDKMath64x64.exp_2(newNominator) * 1e18 ; 
        uint64 resultUint = ABDKMath64x64.toUInt(result);
        return resultUint;
