contract PowersOfTwo {
    uint256 internal constant TWO_POW_1 = 2**1;
    uint256 internal constant TWO_POW_2 = 2**2;
    uint256 internal constant TWO_POW_4 = 2**4;
    uint256 internal constant TWO_POW_8 = 2**8;

    function foo(uint16 x) external view returns(uint256 gasConsumed) {
        uint256 startGas = gasleft();
        uint256 msb = 0;
        if (x >= TWO_POW_8) {
            x >>= 8;
            msb += 8;
        }
        if (x >= TWO_POW_4) {
            x >>= 4;
            msb += 4;
        }
        if (x >= TWO_POW_2) {
            x >>= 2;
            msb += 2;
        }
        if (x >= TWO_POW_1) {
            msb += 1;
        }
        gasConsumed = startGas - gasleft();
    }
    
    function bar(uint16 x) external view returns(uint256 gasConsumed) {
        uint256 startGas = gasleft();
        uint256 msb = 0;
        if (x >= 2**8) {
            x >>= 8;
            msb += 8;
        }
        if (x >= 2**4) {
            x >>= 4;
            msb += 4;
        }
        if (x >= 2**2) {
            x >>= 2;
            msb += 2;
        }
        if (x >= 2**1) {
            msb += 1;
        }
        gasConsumed = startGas - gasleft();
    }   
}
