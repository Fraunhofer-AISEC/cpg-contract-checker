function factorial(int256 x) internal pure returns(int256){
    for(int256 i = x-1; i > 1; i-- ) {
        x = x*i;
    }
    return x;
}
