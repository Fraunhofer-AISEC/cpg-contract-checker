    int128 nominator = 1.8538977 * 1e19;
    nominator = ABDKMath64x64.log_2(nominator);
    int128 newNominator = nominator * rebaseAmount;
    int128 result = ABDKMath64x64.exp_2(newNominator); 
    uint64 uintResult = ABDKMath64x64.toUInt(result);
    return uintResult; 
