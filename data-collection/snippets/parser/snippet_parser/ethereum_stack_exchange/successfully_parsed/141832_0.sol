function getLogBase10001(int128 signedQ64x64Number) internal pure returns (int24) {
    int128 log_2 = ABDKMath64x64.log_2(signedQ64x64Number);

    
    
    
    int128 log_10001 = ABDKMath64x64.mul(log_2, 69318183734137953551959);
}
