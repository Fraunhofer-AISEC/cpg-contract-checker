#define function provideValue(uint32) nonpayable returns () 
#define function getResult() view returns (uint256)

#define constant VALUE = FREE_STORAGE_POINTER() 

#define macro PROVIDE_VALUE() = takes (0) returns (0) {
    0x04 calldataload [VALUE] sstore
}

#define macro GET_RESULT() = takes (0) returns (0) {
    [VALUE] sload
    0x00 mstore
    0x20 0x00 return
}

#define macro MAIN() = takes (0) returns (0) {
    0x00 calldataload 0xe0 shr

    dup1 __FUNC_SIG(provideValue) eq provide jumpi
    dup1 __FUNC_SIG(getResult) eq result jumpi

    provide:
        PROVIDE_VALUE()
    result:
        GET_RESULT()
}
